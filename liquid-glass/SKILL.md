---
name: liquid-glass
description: Premium translucent "Liquid Glass" web design system (CSS/HTML) for SaaS UIs — 4-level glass hierarchy, sidebar/nav, buttons, cards, toggles, and Focus Glass modals/popups, with a matching dark theme. Use when building or styling a SaaS dashboard, admin panel, or any web UI that should look like layered frosted glass.
---

# Liquid Glass — Web Design System

Reusable visual language for premium, minimal SaaS interfaces built from real translucent glass surfaces — never a flat white card with a blur filter slapped on. Standalone reference implementation bundled with this skill: [`assets/demo.html`](assets/demo.html) + [`assets/liquid-glass.css`](assets/liquid-glass.css) — copy both wherever the target project can serve static files, or lift individual rules/tokens straight into an existing stylesheet.

## When to Activate

- Building or restyling a SaaS dashboard, admin panel, or settings screen in HTML/CSS
- Implementing glass-style sidebars, cards, buttons, toggles, or modals on the web
- Asked for "glassmorphism", "verre liquide", "iOS Liquid Glass" translated to a web/CSS product

Not for native iOS/SwiftUI work — use `liquid-glass-design` for the native `.glassEffect()` APIs.

## Core Principle

Every surface is the **same physical material** at a different depth. Never fully transparent, never opaque. The background must stay visible, distorted and softened, through every glass layer — that's what reads as "glass" instead of "white card."

## The 4 Glass Levels

| Level | Class | Use for | Background alpha | Blur | Saturate |
|-------|-------|---------|-------------------|------|----------|
| 1 — Background | `.lg-1` | Sidebar, large low-emphasis containers | 0.10 | 22px | 180% |
| 2 — Surface | `.lg-2` | Standard cards, input fields | 0.16 | 18px | 190% |
| 3 — Elevated | `.lg-3` | Floating panels, active/selected surfaces | 0.24 | 16px | 200% |
| 4 — Focus | `.lg-4` | Modals, popups, dialogs (highest emphasis) | 0.38 | 14px | 210% |

Counter-intuitive but correct: **opacity increases** with elevation while **blur decreases** — higher surfaces are closer to the viewer, so less of the background dissolves through, but more of it stays visible as color, hence higher saturation. Keep alpha low (0.10–0.38) — this is the #1 lever for "looks like glass" vs "looks like a white card." Never raise level backgrounds above ~0.4 alpha.

```css
.lg-2 {
  background: rgba(255, 255, 255, 0.16);
  backdrop-filter: blur(18px) saturate(190%);
  -webkit-backdrop-filter: blur(18px) saturate(190%);
  border: 1px solid rgba(255, 255, 255, 0.55);
  box-shadow:
    0 10px 30px rgba(28, 36, 48, 0.09),   /* soft diffuse drop shadow */
    inset 0 1px 1px rgba(255, 255, 255, 0.55),   /* top specular edge */
    inset 0 -14px 22px -16px rgba(28, 36, 48, 0.14); /* bottom glass thickness */
}
```

## Required Ingredients Per Surface

1. **Translucent tint background** — `rgba(255,255,255, α)`, α from the table above
2. **`backdrop-filter: blur() saturate()`** — blur softens/distorts what's behind; saturate keeps colors from washing out to gray
3. **Hairline border** — needs real contrast against *both* pale and busy backgrounds, not just a whiter tint (see Border Contrast below)
4. **Soft diffuse shadow** — large blur radius, low opacity, no hard black shadows
5. **Inset specular highlight** — `inset 0 1px 1px rgba(255,255,255,0.5-0.7)` on top, plus a soft inset shadow on the bottom edge to fake glass thickness
6. **A colorful background behind it** — glass is invisible without something to refract. Always render surfaces over the `.lg-canvas` blob background, never over a flat solid color.

## Background — Give the Glass Something to Refract

```html
<div class="lg-canvas" aria-hidden="true">
  <div class="lg-blob lg-blob--a"></div>
  <div class="lg-blob lg-blob--b"></div>
  <div class="lg-blob lg-blob--c"></div>
</div>
```

Large blurred organic radial-gradient blobs (warm cream, pale blue-green, pale lavender in light mode — amber/teal/violet glow in dark mode) in fixed position behind the UI. Without this, every glass surface reads as plain gray — the blobs are what make transparency and refraction visible. Keep them subtle enough to never compete with foreground content.

**Pitfall:** don't give `<body>` its own opaque background color — with a fixed, full-viewport canvas layer as first child, an opaque body paint will sit in front of it. Set `background: transparent` on `body` and the base tone on `html` instead. Give the in-flow content wrapper `position: relative; z-index: 1` so it stacks above the fixed canvas (a positioned `z-index: 0` sibling otherwise paints above static in-flow content, not below it).

## Border Contrast

A border tinted purely white (`rgba(255,255,255,x)`) disappears the moment it sits on a pale surface over a pale blob — this is the single most common way this system ends up looking flat instead of glassy. Use `--lg-border-contrast`, a slate-gray tint that holds up regardless of what's behind it:

```css
--lg-border-contrast: rgba(100, 116, 139, 0.35); /* light theme */
--lg-border-contrast: rgba(255, 255, 255, 0.16);  /* dark theme — flips to white-tinted */
```

**Bake it into every level's border by default, including `.lg-1`–`.lg-4` panels — not just small controls.** Earlier guidance here said large panels could keep a pure white-tinted border because size + drop shadow "carry enough separation." That failed in practice: any page with real scroll depth (a dashboard, a stat grid, a settings screen) puts most of its cards far from the fixed `.lg-canvas` blobs, so there's no color underneath to refract and the white border reads as invisible white-on-pale — exactly on the sections users look at most. Blend contrast into the border token itself so it never depends on blob proximity:

```css
--lg-2-border: color-mix(in oklch, var(--lg-border-contrast) 50%, rgba(255, 255, 255, 0.55));
```

Scale the mix ratio with level — lower levels (further from the viewer, more likely to sit over flat background) get more `--lg-border-contrast`; higher levels (modals, popovers — usually near-center or over a scrim) can lean more white:

| Level | Contrast mix |
|-------|-------|
| `.lg-1` | 55% contrast / 45% white |
| `.lg-2` | 50% contrast / 50% white |
| `.lg-3` | 45% contrast / 55% white |
| `.lg-4` | 40% contrast / 60% white |

Small/high-frequency controls (toggle tracks, icon chips, modal close button, secondary/elevated buttons, active nav-item border) still apply `--lg-border-contrast` directly, unmixed — same reasoning, higher stakes since they're smaller and have no shadow to fall back on.

## Components

### Buttons — 3 tiers, same material

| Class | Alpha | Contrast | Use |
|-------|-------|----------|-----|
| `.lg-btn` | 0.12 | Low | Secondary / tertiary actions |
| `.lg-btn.lg-btn--elevated` | 0.22 | Medium | Secondary actions with more weight |
| `.lg-btn.lg-btn--primary` | 0.34 | Highest | The one primary CTA per view |

Buttons are always pill-shaped (`border-radius: 999px`), min 44px tall (touch target), never flat/opaque. Primary never becomes a solid saturated color — it stays translucent, just denser, with a colored border/shadow glow (accent-blue tint) instead of a color fill.

### Sidebar / Nav

Full-height `.lg-1` surface. Active item = small internal `.lg-3`-style capsule (own blur/border/shadow), not a flat color fill. Inactive items are transparent until hover (`rgba(255,255,255,0.14)`).

### Cards

`.lg-card` inside any `.lg-1`–`.lg-4` surface. Vary the level by information hierarchy — a stat card can be `.lg-1`, a profile/settings card `.lg-3`.

### Toggle rows

`.lg-row` + `.lg-toggle` (`role="switch"`, `aria-checked`). Off-state track uses the same low-alpha glass as everything else, with the `--lg-border-contrast` hairline so the track is actually visible; on-state swaps to `--lg-accent-mint-soft`, never a hard saturated fill.

### Modal / Popup — always Level 4

```html
<div class="lg-modal-overlay" hidden>
  <div class="lg-4 lg-modal" role="dialog" aria-modal="true" aria-labelledby="…" aria-describedby="…">
    <button class="lg-modal__close" aria-label="Fermer">…</button>
    …
  </div>
</div>
```

- Overlay scrim: `var(--lg-scrim)` (`rgba(20,26,35,0.28)` light / `rgba(0,0,0,0.5)` dark) + `backdrop-filter: blur(6px)` — darkens and softens the page behind without hiding it
- `.lg-modal-overlay[hidden] { display: none; }` is **required** — the overlay's own `display: flex` rule otherwise beats the `hidden` attribute's UA style and the modal shows on load
- Close on: close button, backdrop click, `Escape`; return focus to the trigger on close

## Color Palette

Off-white, pearl gray, pale blue-gray, extremely pale blue — accents used sparingly:

- `--lg-accent-mint` `#4f9c78` (light) / `#5fd6a3` (dark) — success / ON state
- `--lg-accent-coral` `#e0685c` (light) / `#ff8a7a` (dark) — notification dot
- `--lg-accent-blue` `#4c6fb0` (light) / `#85a6ec` (dark) — links, focus ring, selected nav, primary button glow

Never introduce saturated brand colors as fills. If an accent is needed, tint a glass surface's border/shadow, don't fill it solid.

## Dark Theme

Same material, same token names, same components — only the CSS custom property *values* flip. Never build a second component system for dark mode.

```css
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { /* dark tokens */ }
}
:root[data-theme="dark"] { /* same dark tokens, explicit override */ }
```

```js
document.documentElement.dataset.theme = 'dark'; // or 'light'; omit to follow OS
localStorage.setItem('lg-theme', 'dark');
```

Set the stored theme in a blocking `<head>` script (before the stylesheet paints) to avoid a flash of the wrong theme on load.

- **Background flips from pastel wash to jewel-tone glow**: near-black base (`#101216`) with the same blob shapes now rendered as dim amber/teal/violet glows (`opacity: 0.55`, larger blur) instead of bright pastels.
- **Glass gets *more* transparent, not less** — dark-mode alpha values roughly halve (e.g. Level 2: 0.16 → 0.09). A dark surface needs less white mixed in to still read as "glass" over a dark backdrop; going too opaque turns it into a flat gray card.
- **`--lg-border-contrast` flips from slate-tinted to white-tinted** (`rgba(255,255,255,0.16)` dark vs `rgba(100,116,139,0.35)` light) — a colored border disappears against near-black.
- **Drop shadows flip from ink-gray to pure black** and get more opaque (`--lg-shadow-rgb: 0,0,0`, alpha up to 0.6) since a shadow needs way more contrast to register against an already-dark canvas. The top inset specular highlight also gets brighter per level — that's the primary depth cue in dark mode, more than the outer shadow.
- Accent colors (mint/coral/blue) brighten by ~1 step for AA contrast on dark backgrounds.

## Anti-Patterns

- Opaque white "frosted card" with no visible background through it (alpha too high — check the levels table)
- Pure-white borders on small controls, or on large `.lg-1`–`.lg-4` panels — both vanish against pale surfaces once they're not sitting directly over a colored blob (e.g. scrolled deep into a dashboard); blend `--lg-border-contrast` into the border token itself instead of trusting size/shadow to compensate
- Hard black drop shadows instead of soft diffuse ones
- Flat solid-color buttons/badges instead of tinted glass
- A flat, single-color page background with no blobs to refract
- An opaque `<body>` background color painted in front of a fixed canvas layer (see the stacking pitfall above)
- Skipping the container/grouping discipline in CSS: don't nest 3+ blurred layers directly on top of each other — flatten to one glass surface per visual layer, or performance and clarity both degrade
- Building separate dark-mode components instead of re-pointing the same tokens

## Accessibility Notes

- Text stays fully opaque ink color (`--lg-ink-900` / `--lg-ink-600`) regardless of the glass alpha behind it — never reduce text opacity to "fit" the glass aesthetic
- Verify contrast after lowering any surface alpha — blur+saturate generally helps legibility, but test against both light and busy blob regions, and in both themes
- All interactive elements keep a visible `:focus-visible` outline (`--lg-accent-blue`, 2px, offset)
- Respect `prefers-reduced-motion`
- Toggle rows use `role="switch"` + `aria-checked`; modal uses `role="dialog"` + `aria-modal="true"` + `aria-labelledby`/`aria-describedby`, traps `Escape`, and returns focus to the trigger on close

## Changelog

- **v3** — Corrected the Border Contrast guidance: `.lg-1`–`.lg-4` panel borders now blend `--lg-border-contrast` in by default (level-scaled `color-mix`), not just small controls. Found in production on a dashboard (Litchi) where card contours vanished on full-screen/deep-scroll views — cards far from the fixed canvas blobs had nothing colorful behind them to refract, so the pure white-tinted border read as invisible white-on-pale.
- **v2** — Added a full dark theme (same tokens, flipped values — jewel-tone glow background, lower glass alpha, white-tinted borders, black shadows). Introduced `--lg-border-contrast` after the light theme's white borders proved invisible on pale surfaces.
- **v1** — Initial system: 4 glass levels, sidebar, 3-tier buttons, cards, toggle rows, Focus Glass modal. Tuned for a visibly translucent "real glass" look after first pass read as too opaque/white.
