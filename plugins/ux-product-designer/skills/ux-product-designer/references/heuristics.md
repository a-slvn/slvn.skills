# UX Heuristics & Principles Reference

This file is the authoritative catalog of principles you may cite in WHY justifications. When evaluating a design or making a recommendation, find the most specific principle that applies.

## Table of Contents

1. Nielsen's 10 Usability Heuristics
2. Shneiderman's 8 Golden Rules
3. Tognazzini's First Principles
4. Cognitive Science Laws
5. Gestalt Principles
6. Accessibility Principles (WCAG 2.1)
7. Persuasive Design Principles
8. Mobile-Specific Heuristics

---

## 1. Nielsen's 10 Usability Heuristics

Use these as the PRIMARY framework for heuristic evaluations.

### N1: Visibility of System Status
The system should always keep users informed about what is going on, through appropriate feedback within reasonable time.
- **Apply when:** Deciding whether to show loading states, progress indicators, confirmation messages, status badges.
- **Violation examples:** No loading spinner during async operation; form submitted but no confirmation; file uploading with no progress bar.
- **Reasonable time thresholds:** 0-100ms = instant; 100ms-1s = show spinner; 1-10s = show progress bar with percentage; >10s = show progress + estimated time remaining.

### N2: Match Between System and Real World
The system should speak the users' language, with words, phrases, and concepts familiar to the user, rather than system-oriented terms.
- **Apply when:** Choosing labels, terminology, icon metaphors, information ordering.
- **Violation examples:** "Null reference error" shown to end user; "Payload submitted" instead of "Message sent"; calendar starting on Monday for US audience.
- **Test:** Would the user's grandmother understand this label? If not, rephrase.

### N3: User Control and Freedom
Users often choose system functions by mistake and need a clearly marked "emergency exit" to leave the unwanted state.
- **Apply when:** Deciding on undo support, cancel buttons, back navigation, modal dismissal, destructive action confirmation.
- **Violation examples:** No way to undo delete; modal without close button; multi-step form with no back button; payment flow with no cancel option.
- **Rule of thumb:** Every action that modifies data should be reversible or confirmed.

### N4: Consistency and Standards
Users should not have to wonder whether different words, situations, or actions mean the same thing.
- **Apply when:** Evaluating terminology consistency, button placement, interaction patterns, visual styling.
- **Two types:** Internal consistency (within the product) and external consistency (with platform conventions).
- **Violation examples:** "Save" on one screen, "Submit" on another for the same action; different icon for the same function; inconsistent navigation placement.

### N5: Error Prevention
Even better than good error messages is a careful design which prevents a problem from occurring in the first place.
- **Apply when:** Designing forms, destructive actions, data entry, configuration.
- **Techniques:** Constraints (date picker instead of text field), defaults (pre-fill known values), confirmation (double-check destructive actions), undo (instead of confirmation).
- **Two types:** Slips (unconscious errors — prevent with constraints) and mistakes (conscious wrong decision — prevent with clear information).

### N6: Recognition Rather Than Recall
Minimize the user's memory load by making elements, actions, and options visible.
- **Apply when:** Designing navigation, search, recently-used features, form filling.
- **Violation examples:** Requiring user to remember a code from a previous screen; hiding all navigation behind a hamburger menu; no search suggestions.
- **Key technique:** Show recent items, provide suggestions, keep relevant context visible.

### N7: Flexibility and Efficiency of Use
Accelerators — unseen by the novice user — may often speed up the interaction for the expert user.
- **Apply when:** Deciding on keyboard shortcuts, power-user features, customization, batch operations.
- **Applies differently by audience:** Consumer products favor simplicity; professional tools need accelerators.
- **Examples:** Keyboard shortcuts, command palette, bulk select, saved presets, templates.

### N8: Aesthetic and Minimalist Design
Dialogues should not contain information which is irrelevant or rarely needed.
- **Apply when:** Deciding what content belongs on a screen, information hierarchy, visual noise.
- **Rule:** Every extra unit of information competes with the relevant units and diminishes their visibility.
- **NOT about beauty** — about signal-to-noise ratio. A "pretty" screen that's cluttered still violates this.

### N9: Help Users Recognize, Diagnose, and Recover from Errors
Error messages should be expressed in plain language (no codes), precisely indicate the problem, and constructively suggest a solution.
- **Apply when:** Writing error messages, designing error states, validation feedback.
- **Three parts of a good error:** (1) What happened, (2) Why it happened, (3) What to do next.
- **Bad:** "Error 422" / **Good:** "This email is already registered. Try signing in instead, or use a different email."

### N10: Help and Documentation
Even though it is better if the system can be used without documentation, it may be necessary to provide help.
- **Apply when:** Complex features, onboarding, tooltips, contextual help.
- **Best forms:** Contextual inline help > tooltips > FAQ > full documentation.
- **Rule:** Help should be searchable, focused on the user's task, list concrete steps, and not be too large.

---

## 2. Shneiderman's 8 Golden Rules

Use when Nielsen's heuristics don't cover a specific nuance.

### S1: Strive for Consistency
Same as N4 but also covers: consistent sequences of actions for similar situations, identical terminology in prompts/menus/help, consistent color/layout/font throughout.

### S2: Seek Universal Usability
Design for novices AND experts. Provide explanations for newcomers and shortcuts for frequent users.

### S3: Offer Informative Feedback
For every user action, there should be system feedback. Frequent/minor actions = modest feedback. Infrequent/major actions = substantial feedback.

### S4: Design Dialogs to Yield Closure
Sequences of actions should have a beginning, middle, and end. Provide informative feedback at the completion of a group of actions — gives the user satisfaction and a signal to prepare for the next group.

### S5: Prevent Errors
Same as N5. Additionally: make it impossible to make serious errors through greying out inappropriate menu items, not allowing alphabetic characters in numeric fields, etc.

### S6: Permit Easy Reversal of Actions
Same as N3. This relieves anxiety since the user knows errors can be undone, encouraging exploration.

### S7: Keep Users in Control
Experienced users want to feel they are in charge. Make users the initiators of actions, not the responders. Avoid surprises and changes in familiar behavior.

### S8: Reduce Short-Term Memory Load
Same as N6. The 7±2 rule — avoid interfaces requiring the user to remember information from one screen to use on another.

---

## 3. Cognitive Science Laws

Use these for QUANTITATIVE justifications — when you need to explain WHY a specific number matters.

### Fitts's Law
Time to reach a target = f(distance / size). Larger targets closer to the current position are faster to hit.
- **Apply when:** Sizing buttons, placing CTAs, positioning navigation, designing touch targets.
- **Practical rules:** Primary CTA should be the largest interactive element on the screen. Place it where the thumb naturally rests (mobile) or where the mouse already is (desktop). Minimum touch target: 48x48dp (Android), 44x44pt (iOS).

### Hick's Law (Hick-Hyman Law)
Decision time = log2(n+1) where n = number of choices. More options = slower decisions.
- **Apply when:** Determining how many actions/options to show on one screen, menu design, form design.
- **Practical rules:** Navigation items ≤ 7. Form fields per group ≤ 5-7. Primary actions per screen ≤ 3 (ideally 1). If more options needed, use progressive disclosure.

### Miller's Law
Average person holds 7±2 items in working memory.
- **Apply when:** Structuring information, chunking content, tab counts, step counts.
- **Practical rules:** Chunk phone numbers (555-123-4567, not 5551234567). Group form fields into sections of 3-5. Show 5-9 items before pagination/more.

### Jakob's Law
Users spend most of their time on other sites/apps. They expect your product to work the same as the ones they already know.
- **Apply when:** Choosing patterns for common features (login, checkout, search, settings).
- **Practical implication:** Do not reinvent navigation, form patterns, or standard flows unless you have overwhelming evidence your alternative is better.

### Doherty Threshold
Productivity soars when a computer and its users interact at a pace (<400ms) that ensures neither has to wait on the other.
- **Apply when:** Setting performance requirements, deciding on optimistic UI, skeleton screens.
- **Rule:** If response > 400ms, show loading state. If response > 1000ms, show progress indicator.

### Von Restorff Effect (Isolation Effect)
When multiple similar objects are present, the one that differs from the rest is most likely to be remembered.
- **Apply when:** Designing primary vs secondary actions, highlighting important information, pricing tables.
- **Practical use:** Make the primary CTA visually distinct. Use a different color/size for the promoted option.

### Serial Position Effect
Users tend to remember the first and last items in a series best.
- **Apply when:** Ordering navigation items, list content, onboarding steps.
- **Practical use:** Put the most important nav items first and last. In bottom tabs — most important at edges.

### Zeigarnik Effect
People remember incomplete tasks better than completed ones.
- **Apply when:** Progress indicators, gamification, onboarding checklists, partial saves.
- **Practical use:** Show progress bars for multi-step flows. Use "3 of 5 steps completed" pattern.

### Peak-End Rule
People judge an experience largely based on how they felt at its peak (most intense point) and at its end.
- **Apply when:** Designing completion states, success screens, onboarding conclusions, error recovery.
- **Practical use:** Make success moments delightful. End flows with a clear accomplishment signal.

---

## 4. Gestalt Principles

Use when making layout and grouping decisions.

### Proximity
Objects near each other are perceived as related.
- **Apply when:** Grouping form fields, organizing content sections, spacing between elements.
- **Rule:** Related items should be closer together than unrelated items. The ratio of intra-group to inter-group spacing should be at least 1:2.

### Similarity
Objects that look similar are perceived as related.
- **Apply when:** Consistent styling for same-function elements, distinguishing different types of content.

### Continuity
The eye follows smooth paths. Elements arranged on a line or curve are perceived as related.
- **Apply when:** Layout flow, reading direction, step indicators, progress visualization.

### Closure
The mind tends to complete incomplete shapes. You don't need to draw every border.
- **Apply when:** Card design, grouping, iconography, reducing visual noise.

### Common Region
Elements within a shared boundary are perceived as grouped.
- **Apply when:** Card containers, form field grouping, section dividers.

### Figure-Ground
Users can distinguish foreground from background.
- **Apply when:** Modal overlays, focus states, layered UI, dark backdrop behind modals.

---

## 5. Mobile-Specific Heuristics

Use these IN ADDITION to Nielsen's when evaluating mobile interfaces.

### Thumb Zone Awareness
58% of mobile users use one thumb. Primary actions should be in the easy-reach zone (bottom center of screen).
- **Bottom 1/3:** Easy — primary actions, navigation, frequent controls
- **Middle 1/3:** OK — content, secondary actions
- **Top 1/3:** Hard — infrequent actions, status info, back/close buttons

### Touch Target Minimums
- iOS: 44x44pt minimum
- Android: 48x48dp minimum (recommended)
- Spacing between targets: minimum 8dp
- FAB (floating action button): 56dp standard

### Content Priority Hierarchy
Mobile screen = scarce real estate. Every pixel must earn its place.
- Show only essential content per screen
- Use progressive disclosure for details
- Prioritize by frequency of use, not organizational hierarchy

### Interruption Resilience
Mobile users get interrupted constantly. Design must handle:
- Auto-save drafts
- Return-to-last-state
- Background sync
- Graceful timeout handling

### Context Awareness
Mobile users are often: in transit, multitasking, in poor network conditions, in varying light conditions.
- Design for one-handed use
- Support offline / poor connectivity
- Use high contrast for outdoor readability
- Keep sessions short and completeable

---

## 6. Key WCAG 2.1 AA Requirements

Use when justifying accessibility decisions.

### Perceivable
- Color contrast: minimum 4.5:1 for normal text, 3:1 for large text (18px+ bold or 24px+ regular)
- Text alternatives for all non-text content
- Captions for audio/video content
- Content adaptable to different presentations without losing meaning

### Operable
- All functionality available from keyboard
- Enough time to read and use content (no auto-advancing without control)
- No content that flashes more than 3 times per second
- Multiple ways to find pages (search, sitemap, navigation)

### Understandable
- Text readable and understandable
- Pages operate in predictable ways
- Users helped to avoid and correct mistakes (input assistance)

### Robust
- Content compatible with current and future user agents, including assistive technologies
