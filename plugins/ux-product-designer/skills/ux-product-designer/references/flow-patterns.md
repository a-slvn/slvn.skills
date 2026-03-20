# Common UX Flow Patterns

Reference catalog of proven flow patterns. Use these as starting points — not as rigid templates. Every adaptation must include a WHY justification.

---

## Table of Contents

1. Authentication Flows
2. Onboarding Flows
3. E-Commerce / Checkout
4. Search & Filter
5. CRUD (Create, Read, Update, Delete)
6. Settings & Preferences
7. Empty States & First-Time Experience
8. Error Recovery Patterns
9. Multi-Step Forms (Wizards)
10. Notification & Communication

---

## 1. Authentication Flows

### Sign Up (Standard)
```
Entry → Email input → Password creation → Email verification → Profile setup (optional) → Dashboard
```
**Critical decisions:**
- Password requirements: show rules upfront, validate inline, never on submit
- Email verification: blocking (must verify to continue) vs non-blocking (can use app, banner reminds)
- Social sign-up: reduces friction but adds dependency. Offer as alternative, not replacement.
- WHY (progressive disclosure): Collect minimum info to start. Defer profile details until user has experienced value.

### Sign In
```
Entry → Email → Password → Dashboard
         ↓               ↓
    "Create account"   "Forgot password"
```
**Critical decisions:**
- Remember email: always (reduces friction for returning users). WHY: N7 — flexibility for frequent users.
- Biometric option: offer if device supports. WHY: Fitts's law — biometric is zero-distance interaction.
- Error messaging: "Incorrect email or password" (never reveal which one is wrong — security).

### Password Reset
```
Forgot password → Enter email → Check email banner → Email link → New password → Confirmation → Sign in
```
**Critical rules:**
- NEVER tell user whether email exists in system (security)
- Show "check your email" regardless of whether email is registered
- Link should expire (15-60 minutes)
- After reset, auto-sign-in or redirect to sign-in with success message

---

## 2. Onboarding Flows

### Progressive Onboarding (Recommended)
Instead of front-loading, reveal features as user encounters them.
```
Sign up → Minimal setup (1-2 screens max) → Core experience → Contextual tooltips as user explores
```
WHY: Cognitive load theory — users cannot absorb 5+ screens of instructions before using the product.

### Wizard Onboarding
When setup IS the value (e.g., configuring a workspace, picking preferences).
```
Welcome → Step 1 (essential) → Step 2 (important) → Step 3 (nice-to-have) → "Skip" option at every step → Dashboard
```
**Critical rules:**
- Progress indicator required (Zeigarnik effect — incomplete tasks motivate completion)
- Skip option on EVERY non-essential step (N3 — user control and freedom)
- Max 5 steps — if more needed, defer to settings
- Each step must provide visible value or explain WHY this info is needed

### Value-First Onboarding
Let user experience core value BEFORE requiring sign-up.
```
Landing → Core feature (no account needed) → User sees value → Sign up prompt → Account creation
```
WHY: Peak-end rule — if the first experience is bureaucratic (forms, verification), the peak is negative.

---

## 3. E-Commerce / Checkout

### Standard Checkout Flow
```
Cart → Shipping info → Payment → Review → Confirmation
  ↓        ↓              ↓         ↓
 Edit    Address book   Saved cards  Edit any step
```
**Critical rules:**
- Guest checkout MUST be available (do not force account creation — #1 cause of cart abandonment)
- Show order summary at every step (N1 — visibility of system status)
- Allow editing any previous step without losing entered data
- Progress indicator required
- Security badges visible at payment step

### Express Checkout
For returning users:
```
Cart → 1-tap buy (saved address + saved card) → Confirmation
```
WHY: N7 (flexibility and efficiency) — expert users should not repeat what the system already knows.

### Cart Patterns
- **Persistent cart:** Always accessible (badge with count in nav). Standard for e-commerce.
- **Side drawer cart:** Opens over current page. Good for multi-item shopping without context switch.
- **Full-page cart:** For complex items needing configuration. Use when items have many options.

---

## 4. Search & Filter

### Search Flow
```
Search icon/bar → Focus → Keyboard appears → Type → Results appear live → Select result → Detail
                                               ↓
                                    Recent searches shown
                                    Suggestions shown
```
**Critical rules:**
- Show recent searches on focus (N6 — recognition over recall)
- Show suggestions after 2+ characters
- Debounce input (300ms) to avoid excessive API calls
- Empty results: show suggestions, not just "No results found"
- Highlight matching text in results

### Filter Pattern
```
Results list → Filter button → Filter panel (bottom sheet on mobile, sidebar on desktop) → Apply → Filtered results
```
**Critical decisions:**
- Show active filter count on the filter button ("Filters (3)")
- "Clear all" always visible when filters are active
- On mobile: full-screen filter with "Show N results" button at bottom
- On desktop: persistent sidebar filter with live-updating results
- WHY: N1 (visibility of system status) — user must always know what filters are active

---

## 5. CRUD Patterns

### Create
```
Trigger (+ button / "New" action) → Form / Editor → Save → Confirmation + Navigate to created item
```
**Key rules:**
- Auto-save drafts (every 30 seconds or on every change for small forms)
- Unsaved changes: warn on navigation away ("You have unsaved changes. Leave anyway?")
- After creation: navigate to the new item (not back to list) — user wants to see what they made

### Read / Detail View
```
List → Tap item → Detail view → Actions (edit, delete, share)
                       ↓
              Related items / recommendations
```
**Hierarchy:** Title → key metadata → primary content → secondary content → actions → related items.

### Update / Edit
Two patterns:
1. **Inline edit:** Tap field to edit in place. Best for simple changes (name, status).
2. **Edit mode:** "Edit" button transforms view into form. Best for complex objects with many fields.

**Critical rule:** Always show what changed. Highlight modified fields. Show "last edited" timestamp.

### Delete
```
Delete action → Confirmation ("Delete [item name]? This cannot be undone.") → Delete → Undo snackbar (5 sec)
```
**Critical rules:**
- Name the item being deleted in the confirmation ("Delete 'Q3 Budget'?" not "Delete this item?")
- Soft delete with undo > hard delete with confirmation (N3 — user control and freedom)
- If undo is not possible, require explicit confirmation (type item name, or checkbox)

---

## 6. Settings & Preferences

### Structure Pattern
```
Settings screen → Category groups → Individual settings
```
**Organization rules:**
- Group by user mental model, not technical categories
  - Good: "Notifications", "Privacy", "Appearance"
  - Bad: "System", "API", "Configuration"
- Most-changed settings first (serial position effect — first items remembered)
- Dangerous settings (delete account, reset data) at bottom, visually separated
- Every toggle/switch should take effect immediately (no "Save" button for toggles)
  WHY: S3 (informative feedback) — immediate effect IS the feedback

### Toggle vs Checkbox (Mobile)
- **Toggle:** For binary on/off with immediate effect
- **Checkbox:** For selecting multiple items from a list (apply with a "Save" action)
- NEVER use checkboxes as toggles on mobile — they're too small and the metaphor doesn't match
  WHY: Jakob's law — mobile users expect toggles from every other app they use

---

## 7. Empty States & First-Time Experience

### Empty State Formula
Every empty state screen must include:
1. **Illustration or icon** — visual signal that this is intentional, not broken
2. **Headline** — what this screen will contain ("No messages yet")
3. **Description** — brief explanation or encouragement
4. **CTA** — the action to fill this state ("Send your first message")

WHY: N1 (visibility of system status) — an empty screen with no explanation looks broken.

### First-Time vs Returning Empty
- **First-time:** Educational tone. Explain what will appear here and how to get started.
- **Returning empty:** State-aware. "All caught up!" or "No results for this filter" — user knows what should be here.

---

## 8. Error Recovery Patterns

### Network Error
```
Action fails → Error banner ("Connection lost. Retrying...") → Auto-retry (3x with backoff) → If still failing: manual retry button
```
WHY: S5 (prevent errors) — auto-retry handles transient failures without burdening the user.

### Form Validation Error
```
User submits → Inline errors per field (red border + text) + summary at top → Focus on first error field → User fixes → Validate on blur
```
**Rules:**
- Show errors inline next to the field (not just at top or bottom)
- Validate on blur (when user leaves the field), not on every keystroke
- After showing an error, re-validate on change (instant feedback on fix)
- Clear error as soon as input becomes valid

### Permission Denied
```
Action attempted → Explanation ("You need admin access to delete projects") → Path forward ("Request access" or "Contact [admin name]")
```
WHY: N9 (help recognize, diagnose, recover) — every error must include what, why, and what to do.

---

## 9. Multi-Step Forms (Wizards)

### When to Use
- Form has > 7 fields
- Fields have logical groupings
- Later fields depend on earlier answers
- User needs guidance through a complex process

### Structure
```
Step 1: [Group A fields] → Step 2: [Group B fields] → ... → Review → Submit
```

### Required Elements
- **Progress indicator:** Shows current step, total steps, and labels for each (Zeigarnik effect)
- **Back button:** On every step except the first (N3 — user control)
- **Step summary:** The review step shows ALL entered data with "Edit" links per section
- **Auto-save:** Between steps, save progress. If user returns later, resume where they left off
- **Validation:** Validate per-step on "Next" — do not let user advance with errors

### Step Size Rules
- 3-5 fields per step (Miller's law — chunking)
- Related fields on the same step (Gestalt: proximity)
- Do not split a logical group across steps (e.g., first name on step 1, last name on step 2 is wrong)

---

## 10. Notification & Communication

### Notification Hierarchy
From least intrusive to most:

| Level | Pattern | Use When |
|-------|---------|----------|
| 1 | Badge/dot (icon) | Passive — new content available, no urgency |
| 2 | In-app banner (top) | Informational — action suggested but not required |
| 3 | Toast/snackbar (bottom) | Feedback — action just completed or minor alert |
| 4 | Push notification | Important — time-sensitive, user is not in app |
| 5 | Modal / alert | Critical — immediate action required, blocking |

**Rule:** Use the LEAST intrusive level that serves the purpose. Over-notification trains users to ignore everything.
WHY: N8 (aesthetic and minimalist design) — every notification competes with the user's current task.

### Notification Content Rules
- **Title:** What happened (not who you are — the user knows your app)
- **Body:** Why it matters + what to do
- **Action:** Deep link to the relevant content, not home screen
- **Grouping:** Bundle similar notifications (5 messages → "5 new messages from [channel]")
