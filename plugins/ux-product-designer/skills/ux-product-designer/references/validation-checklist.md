# Self-Validation Checklist

Run this checklist after completing EVERY design deliverable. Do NOT skip items. Report all results to the user — including passes.

---

## A. Flow-Level Checks

### A1: Completeness
- [ ] Happy path is fully mapped from entry to success state
- [ ] Every decision point has ALL branches defined (not just the obvious ones)
- [ ] Error states exist for every action that can fail (network, validation, permissions, timeout)
- [ ] Empty states are defined for every screen that displays dynamic content
- [ ] First-time user experience differs from returning user where appropriate
- [ ] "Back" behavior is defined for every screen (where does the user go?)

### A2: Cognitive Load
- [ ] No screen has more than 3 primary actions — if it does, justify with a WHY or split the screen
- [ ] No flow requires user to remember information from a previous screen without it being visible
- [ ] Total steps in the happy path ≤ 7 for a simple task, ≤ 12 for a complex task — exceeding needs justification
- [ ] Every screen has a single clear purpose that you can state in one sentence

### A3: Recoverability
- [ ] User can go back at every step (no dead-end screens)
- [ ] Destructive actions have either undo or confirmation
- [ ] If a multi-step flow is interrupted (app killed, network lost), user can resume from where they left off
- [ ] Error states include a recovery action (not just "something went wrong")

### A4: Entry & Exit Points
- [ ] All entry points are identified (direct navigation, deep links, notifications, search results)
- [ ] All exit points are identified (completion, abandonment, error bailout)
- [ ] Deep links land on a meaningful screen (not a broken state if user has no context)
- [ ] Push notification taps lead to the relevant content, not just the home screen

---

## B. Screen-Level Checks

### B1: Five States Rule
For EVERY screen, verify all five states are defined:
- [ ] Default (normal content loaded)
- [ ] Loading (content is being fetched)
- [ ] Empty (no content exists yet)
- [ ] Error (something went wrong)
- [ ] Success (action completed — if applicable)

If a state is "not applicable" — explicitly note why (e.g., "No loading state: all content is local / pre-fetched").

### B2: Content Hierarchy
- [ ] The most important element is the most visually prominent
- [ ] Reading order (top-to-bottom, left-to-right in LTR layouts) matches importance order
- [ ] Secondary information is clearly subordinate (smaller, muted, collapsed)
- [ ] Spacing groups related items and separates unrelated items (Gestalt: proximity)

### B3: Interaction Clarity
- [ ] Every interactive element is obviously interactive (looks tappable/clickable)
- [ ] Non-interactive elements do NOT look interactive (no underlined non-link text, no button-shaped divs)
- [ ] Primary action is visually distinct from secondary actions (Von Restorff effect)
- [ ] Disabled states are visually clear (greyed out, reduced opacity) with explanation of why disabled

### B4: Labels and Copy
- [ ] Button labels describe the action from the user's perspective ("Save recipe" not "Submit")
- [ ] Error messages include what happened, why, and what to do next
- [ ] Form labels are above or beside the field (not placeholder-only — placeholder disappears on focus)
- [ ] No jargon, technical terms, or system language visible to end users

---

## C. Platform-Specific Checks

### C1: Mobile
- [ ] Primary actions are in the thumb-friendly zone (bottom 1/3 of screen)
- [ ] Touch targets ≥ 44pt (iOS) or 48dp (Android)
- [ ] Spacing between touch targets ≥ 8dp
- [ ] Screen content is usable in portrait orientation (landscape optional unless justified)
- [ ] Text is readable without zooming (minimum 16px / 17pt for body)
- [ ] Horizontal scrolling is avoided (vertical scroll only, unless carousel pattern)
- [ ] System navigation (back gesture, status bar, home indicator) is not obstructed

### C2: Tablet
- [ ] Layout uses available screen space (not just a scaled-up phone layout)
- [ ] Multi-column or list-detail pattern is used where appropriate
- [ ] Both orientations are considered (portrait and landscape)
- [ ] Keyboard and pointer input are supported (if iPadOS / ChromeOS)

### C3: Desktop
- [ ] Hover states exist for every interactive element
- [ ] Focus indicators are visible for keyboard navigation
- [ ] Keyboard shortcuts are available for frequent actions
- [ ] Content width is constrained to readable line length (50-75 characters)
- [ ] Right-click / context menu is supported where appropriate
- [ ] Window resizing behavior is defined (min-width, responsive behavior)

---

## D. Accessibility Checks (WCAG 2.1 AA Minimum)

- [ ] Color is not the ONLY means of conveying information (e.g., error states have icon + color, not just red)
- [ ] Text contrast ratio ≥ 4.5:1 (normal text) or ≥ 3:1 (large text, 18px+ bold or 24px+)
- [ ] Interactive element contrast ratio ≥ 3:1 against background
- [ ] All images / icons have text alternatives (or are marked decorative)
- [ ] Screen reader flow follows a logical order (not visual order if they differ)
- [ ] Focus order matches visual order
- [ ] No content relies solely on motion, spatial position, or visual cues

---

## E. Evidence Checks

- [ ] Every design decision includes a WHY with a named principle
- [ ] No recommendations are based on personal preference or "best practice" without citation
- [ ] Platform-specific decisions cite the correct platform guideline (iOS HIG, Material Design 3, or WCAG)
- [ ] When two principles conflict, the resolution is explicitly stated with reasoning

---

## Reporting Format

After running the checklist, report as:

```
VALIDATION REPORT
=================
Total checks: [count]
Passed: [count]
Failed: [count]
Not applicable: [count]

FAILURES:
---------
[Check ID]: [Check name]
  Issue: [What's wrong]
  Fix: [Specific action to resolve]
  WHY: [Principle that demands this fix]

N/A ITEMS:
----------
[Check ID]: [Reason it doesn't apply]
```

Fix ALL failures before delivering to the user. If a failure cannot be fixed without user input, flag it as "BLOCKED — needs user decision" and present the options.
