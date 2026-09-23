---
name: awesome-claude-design
description: Curated collection of 30+ real DESIGN.md files (Linear, Apple, Figma, Ferrari, Vercel, Datadog, Claude, Mercury, and more) organized by aesthetic family (editorial, glass, cinematic, terminal, brutalist, playful, warm, data-dense, remix). Use when the user wants a design-system starting point for a new UI/site/app — picking an aesthetic, extracting design tokens (colors, type, spacing, components) from a reference brand, or remixing two brand styles together. Source: github.com/rohitg00/awesome-claude-design (MIT).
license: MIT — source repo github.com/rohitg00/awesome-claude-design, files are unofficial community-curated interpretations, not affiliated with the named brands.
---

# Awesome Claude Design

Local mirror of real `DESIGN.md` files — plain-text design-system specs (colors, type, spacing,
component rules, do's/don'ts, responsive behavior) written in a format an agent can act on
directly, without needing claude.ai/design.

## When to use

- User wants a new site/app to "feel like" a known brand (Linear, Apple, Stripe, Ferrari...)
- User wants a design system scaffolded (CSS tokens + component rules) but has no brand brief
- User wants to remix two aesthetics (see `design-md/remix/`)

## Catalog (`design-md/`)

| Family | Files |
|---|---|
| `editorial/` | linear, vercel |
| `glass/` | apple, arc |
| `cinematic/` | bmw, cohere, ferrari, lamborghini, minimax, nvidia, renault, runway, tavus |
| `terminal/` | ollama, opencode, warp |
| `brutalist/` | the-verge |
| `playful/` | canva, figma, toss |
| `warm/` | claude, mercury |
| `indie/` | granola |
| `data-dense/` | clickhouse, datadog, mongodb, posthog |
| `remix/` | granola-x-criterion, linear-x-claude, mercury-x-linear, notion-x-duolingo, ollama-x-elevenlabs, stripe-x-a24, vercel-x-pitchfork, warp-x-sentry |

## How to use it (directly in Claude Code, no claude.ai/design needed)

1. Ask the user which aesthetic/brand fits, or suggest 2-3 based on their project (e.g. e-commerce
   → editorial/glass/playful; dashboard/SaaS → data-dense/cinematic).
2. Read the matching file under `design-md/<family>/<brand>.md`.
3. Apply it to the target codebase directly:
   - Extract color tokens → CSS variables / Tailwind config
   - Extract type scale → font stack + heading/body sizes
   - Extract component rules → button/card/nav styling conventions
   - Follow the do's/don'ts section to keep future edits on-system
4. For a from-scratch brand instead of an existing one, see `recipes/brand-extraction.md` and
   `prompts/brand-to-design-md.md`.
5. For remixing two brands' tokens into one system, see `design-md/remix/` for examples and
   `prompts/remix-two-brands.md` for the method.

## Extra references

- `prompts/` — reusable prompts: `audit-live-site.md`, `family-picker.md`,
  `break-default-aesthetic.md`, `3-designer-debate.md`
- `recipes/` — practical workflows: `figma-to-design-md.md`, `landing-page-20-min.md`,
  `repo-to-design-system.md`, `wireframe-to-hifi.md`

## Note

These are community-curated, publicly-observable-pattern interpretations — not official brand
assets. Do not present output as an official design system from the named company.
