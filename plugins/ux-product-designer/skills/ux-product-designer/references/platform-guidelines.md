# Platform-Specific Design Guidelines

Consult this file when designing for a specific device class. Rules here override general heuristics when they conflict — platform conventions always win on their home platform.

## Table of Contents

1. Mobile (iOS)
2. Mobile (Android / Material Design 3)
3. Tablet
4. Desktop / Web
5. Cross-Platform Decision Trees
6. Responsive Breakpoints

---

## 1. Mobile — iOS (Apple Human Interface Guidelines)

### Navigation Patterns

| Pattern | When to Use | Max Items |
|---------|------------|-----------|
| Tab bar (bottom) | 3-5 top-level sections, all equally important | 5 (including "More") |
| Navigation controller (push/pop) | Hierarchical content, drill-down | No limit, but ≤ 3 deep for frequent tasks |
| Modal (sheet) | Self-contained sub-task, or interrupting flow | — |
| Page control (dots) | Flat content of same type (onboarding, gallery) | ≤ 7 pages |

### Key iOS Conventions
- **Back navigation:** Top-left back arrow with previous screen title. Swipe-from-left-edge to go back. NEVER hide this or replace with a custom gesture.
- **Large titles:** Use large title style for top-level screens. Collapses on scroll.
- **Bottom safe area:** Respect home indicator area. Do not place interactive elements in the bottom 34pt on notched iPhones.
- **Haptic feedback:** Use for confirmation, selection changes, and important state transitions.
- **Pull-to-refresh:** Standard for list-based content. Users expect it.
- **Sheets (iOS 15+):** Use half-sheet (.medium detent) for quick selections, full-sheet for complex sub-tasks.
- **Context menus:** Long-press for contextual actions on items. Replace older action sheet pattern for item-specific actions.

### iOS Typography
- System font: SF Pro (automatically adapts to Dynamic Type)
- Support Dynamic Type: all text must scale with user preference
- Minimum body text: 17pt
- Minimum caption: 12pt (but 13pt preferred)

### iOS Touch Targets
- Minimum: 44x44pt
- Recommended for primary actions: 48x48pt or larger
- Spacing between targets: minimum 8pt

---

## 2. Mobile — Android (Material Design 3)

### Navigation Patterns

| Pattern | When to Use | Max Items |
|---------|------------|-----------|
| Navigation bar (bottom) | 3-5 top-level destinations | 5 |
| Navigation drawer | 5+ destinations, or destinations with long labels | No limit (use sections) |
| Navigation rail | Tablet/foldable, 3-7 destinations | 7 |
| Top app bar | Screen title, contextual actions, navigation | 2-3 actions |

### Key Android Conventions
- **Back button / gesture:** System back (hardware/gesture) must be handled. Predictive back animations (Android 14+).
- **FAB (Floating Action Button):** For the single most important action on a screen. Maximum 1 FAB per screen. Position: bottom-right (standard) or bottom-center (if navigation bar present).
- **Bottom sheets:** Standard (modal) for blocking sub-tasks. Expanding for non-blocking additional content.
- **Snackbar:** For brief feedback messages. Position at bottom, above FAB if present. Auto-dismiss after 4-10 seconds. Can include one action button.
- **Swipe actions:** Swipe-to-dismiss, swipe-to-delete, swipe-to-archive. Use with caution — always provide undo.

### Material Design 3 Specifics
- Dynamic color: surfaces adapt to user's wallpaper theme
- Elevation model: tonal elevation (color shift) instead of shadow-based elevation
- Shape system: rounded corners with consistent corner radii per component type
- Typography: default to Roboto, support variable font weights

### Android Touch Targets
- Minimum: 48x48dp
- Recommended for primary actions: 56x56dp (FAB standard)
- Spacing between targets: minimum 8dp

---

## 3. Tablet

Tablets occupy a middle ground. Key differences from phone:

### Layout Strategy
- **DO:** Use multi-column layouts. List-detail pattern is the default for content-heavy apps.
- **DO:** Increase information density — more content visible per screen.
- **DO NOT:** Simply scale up the phone layout. This wastes screen space and creates uncomfortably large touch targets.

### Split View / List-Detail
- Primary pattern for tablets: master list on left (1/3 width), detail on right (2/3 width).
- On narrow tablets or portrait orientation, may collapse to phone-style navigation.
- Keep navigation visible — do not hide behind hamburger on tablet.

### Tablet-Specific Rules
- Touch targets: same minimums as phone (44pt iOS, 48dp Android) — do NOT increase just because screen is bigger.
- Text size: can be slightly smaller than phone due to typical viewing distance, but still respect platform minimums.
- Navigation: use navigation rail (Android) or sidebar (iOS) instead of bottom tabs. Bottom tabs on tablet feel wasteful.
- Keyboard support: many tablet users attach keyboards. Support keyboard shortcuts for common actions.

### iPad Specifics
- Support multitasking: Split View, Slide Over, Stage Manager (iPadOS 16+)
- Support pointer (trackpad/mouse): hover states, right-click context menus
- Use toolbar pattern for contextual actions
- Support drag and drop between apps

---

## 4. Desktop / Web

### Layout
- **Max content width:** 1200-1440px for reading content. Do not stretch text across full viewport on wide screens.
- **Grid:** 12-column grid, 24px gutters. Responsive columns collapse at breakpoints.
- **Sidebar navigation:** Standard for applications. Collapsible for more content space.
- **Multi-panel:** Power-user applications benefit from persistent panels (navigation + content + properties).

### Desktop-Specific Interactions
- **Hover states:** REQUIRED for every interactive element. Users expect visual feedback on hover.
- **Right-click context menus:** Provide for items that support multiple actions.
- **Keyboard shortcuts:** Provide for all frequent actions. Show shortcut hints in tooltips and menus.
- **Drag and drop:** Support for reordering, file upload, and cross-panel operations.
- **Text selection:** Allow text selection on all non-interactive text. Do not prevent browser defaults.
- **Focus indicators:** Visible focus ring on every interactive element for keyboard navigation.
- **Scroll:** Prefer long scroll over pagination for content. Use sticky headers for context.

### Desktop Navigation Decision Tree
```
How many top-level sections?
├─ 1-3 → Top horizontal nav (simple sites/apps)
├─ 4-8 → Sidebar nav (persistent, collapsible)
├─ 8-15 → Sidebar with grouped sections
└─ 15+ → Sidebar with search + groups + collapsible subsections
```

### Desktop Typography
- Body text: 14-16px (16px preferred for reading-heavy)
- Line height: 1.4-1.6x font size
- Line length: 50-75 characters per line (optimal readability)
- Heading hierarchy: clear visual steps between H1-H4

### Desktop Form Design
- Label position: above field (fastest for scanning) or left-aligned (compact for short forms)
- Field width: should suggest expected input length (email = full width, zip code = short)
- Inline validation: validate on blur, not on every keystroke
- Tab order: must be logical and follow visual layout
- Submit button: align with the form fields, not floating or centered

---

## 5. Cross-Platform Decision Trees

### Choosing a Navigation Pattern

```
Start here: What platform?
│
├─ Mobile (phone)
│  ├─ How many top-level sections?
│  │  ├─ 2-5 → Bottom tab bar
│  │  ├─ 5+ → Hamburger + search (BUT consider restructuring to ≤5)
│  │  └─ 1 (single deep task) → Stack navigation only
│  └─ Is this a utility/tool? → Consider bottom sheet pattern
│
├─ Tablet
│  ├─ Content list + detail → Split view (list-detail)
│  ├─ Multiple sections → Navigation rail (Android) / sidebar (iPadOS)
│  └─ Creative tool → Toolbar + canvas + inspector panels
│
└─ Desktop
   ├─ Content site → Top nav + search
   ├─ SaaS application → Sidebar nav + content area
   ├─ Creative/dev tool → Multi-panel with customizable layout
   └─ Dashboard → Sidebar nav + grid of cards/widgets
```

### Choosing a Feedback Pattern

```
What happened?
│
├─ User action succeeded
│  ├─ Minor action (toggle, like) → Micro-animation (< 300ms)
│  ├─ Form submitted → Success banner + clear next step
│  └─ Task completed → Success screen with celebration + next action
│
├─ User action failed
│  ├─ Form validation → Inline error per field + summary at top
│  ├─ Network error → Retry button + explanation
│  └─ Permission denied → Explain why + how to get access
│
├─ System is working
│  ├─ < 1 second → No indicator (or subtle spinner)
│  ├─ 1-10 seconds → Skeleton screen OR progress bar
│  └─ > 10 seconds → Progress bar + ETA + ability to cancel
│
└─ Destructive action pending
   ├─ Reversible → Just do it + show undo (snackbar pattern)
   └─ Irreversible → Confirmation dialog with clear consequences
```

---

## 6. Responsive Breakpoints (Standard Reference)

| Breakpoint | Device Class | Typical Width | Columns |
|-----------|-------------|---------------|---------|
| xs | Small phone | < 360px | 4 |
| sm | Phone | 360-599px | 4 |
| md | Tablet portrait / large phone | 600-904px | 8 |
| lg | Tablet landscape / small desktop | 905-1239px | 12 |
| xl | Desktop | 1240-1439px | 12 |
| xxl | Large desktop | ≥ 1440px | 12 (max-width content) |

### What Changes at Each Breakpoint

**xs → sm:** Minimal changes. Adjust padding, font sizes.
**sm → md:** Switch from single-column to multi-column where appropriate. Show navigation rail instead of bottom tabs. Increase information density.
**md → lg:** List-detail pattern activates. Sidebar navigation appears. Two-panel layouts.
**lg → xl:** Three-panel layouts possible. More content visible. Keyboard shortcut hints shown.
**xl → xxl:** Content max-width reached. Additional whitespace on sides. No layout changes needed.
