#!/usr/bin/env bash
# validate-deck.sh — Check presentation quality before deployment
# Usage: bash scripts/validate-deck.sh /path/to/project
set -euo pipefail

PROJECT_DIR="${1:-.}"
INDEX="$PROJECT_DIR/index.html"
NOTES="$PROJECT_DIR/speaker-notes.md"

RED='\033[0;31m'; YELLOW='\033[1;33m'; GREEN='\033[0;32m'; NC='\033[0m'
ERRORS=0; WARNINGS=0

error() { echo -e "${RED}ERROR:${NC} $1"; ((ERRORS++)); }
warn()  { echo -e "${YELLOW}WARN:${NC} $1"; ((WARNINGS++)); }
ok()    { echo -e "${GREEN}OK:${NC} $1"; }

echo "========================================="; echo "  Sales Deck Validator"; echo "  Project: $PROJECT_DIR"; echo "========================================="
echo ""
echo "--- File Structure ---"
[ ! -f "$INDEX" ] && error "index.html not found" || ok "index.html exists"
[ ! -f "$NOTES" ] && error "speaker-notes.md not found" || ok "speaker-notes.md exists"
[ ! -f "$PROJECT_DIR/package.json" ] && warn "package.json missing (needed for Vercel)" || ok "package.json exists"

echo ""
echo "--- Slide Content ---"
if [ -f "$INDEX" ]; then
  SLIDE_COUNT=$(grep -c 'data-slide=' "$INDEX" 2>/dev/null || echo 0)
  [ "$SLIDE_COUNT" -lt 3 ] && error "Only $SLIDE_COUNT slides — minimum 5 recommended" || \
  [ "$SLIDE_COUNT" -lt 5 ] && warn "$SLIDE_COUNT slides — consider more" || ok "$SLIDE_COUNT slides found"
  grep -qi "lorem ipsum" "$INDEX" && error "Lorem ipsum found"
  grep -qiE "TODO|TBD|FIXME|PLACEHOLDER|INSERT.*BLOCK" "$INDEX" && error "Placeholder markers found" || ok "No placeholder text"
  TITLE=$(grep -oP '(?<=<title>).*?(?=</title>)' "$INDEX" 2>/dev/null || echo "")
  ([ -z "$TITLE" ] || echo "$TITLE" | grep -qi "presentation title") && warn "Page title missing or generic" || ok "Title: $TITLE"
  IMG_REFS=$(grep -oP 'src="([^"]*\.(png|jpg|jpeg|svg|webp|gif))"' "$INDEX" 2>/dev/null | sed 's/src="//;s/"//' || true)
  if [ -n "$IMG_REFS" ]; then
    BROKEN=0
    while IFS= read -r img; do
      [[ "$img" != http* ]] && [ ! -f "$PROJECT_DIR/$img" ] && { warn "Image not found: $img"; ((BROKEN++)); }
    done <<< "$IMG_REFS"
    [ "$BROKEN" -eq 0 ] && ok "All local image paths valid"
  fi
fi

echo ""
echo "--- Speaker Notes ---"
if [ -f "$NOTES" ]; then
  NOTE_SLIDES=$(grep -c '^## Slide' "$NOTES" 2>/dev/null || echo 0)
  [ "$SLIDE_COUNT" -gt 0 ] && [ "$NOTE_SLIDES" -lt "$SLIDE_COUNT" ] && error "Notes cover $NOTE_SLIDES slides, deck has $SLIDE_COUNT" || ok "Notes for all $NOTE_SLIDES slides"
  TOTAL_LINES=$(wc -l < "$NOTES")
  [ "$NOTE_SLIDES" -gt 0 ] && { AVG=$((TOTAL_LINES / NOTE_SLIDES)); [ "$AVG" -lt 8 ] && warn "Notes avg $AVG lines/slide — aim for 8+" || ok "Notes depth good (avg $AVG lines/slide)"; }
  grep -qi "talking points" "$NOTES" || warn "No 'Talking points' sections in notes"
fi

echo ""
echo "========================================="
[ "$ERRORS" -gt 0 ] && { echo -e "${RED}FAILED: $ERRORS error(s), $WARNINGS warning(s)${NC}"; exit 1; } || \
[ "$WARNINGS" -gt 0 ] && { echo -e "${YELLOW}PASSED with $WARNINGS warning(s)${NC}"; exit 0; } || \
{ echo -e "${GREEN}ALL CHECKS PASSED${NC}"; exit 0; }
