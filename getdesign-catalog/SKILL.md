---
name: getdesign-catalog
description: Index of 68 real brand DESIGN.md files hosted on getdesign.md (Apple, Stripe, Linear, Tesla, Nike, Ferrari, Spotify, Vercel, Airbnb, Notion, and more) — files are NOT stored locally, this skill fetches one on demand via its getdesign.md URL. Use when the user wants a design-system starting point for a new UI/site and awesome-claude-design's local 30-brand collection doesn't have the brand they want. Source: github.com/VoltAgent/awesome-claude-design (MIT).
license: MIT — source repo github.com/VoltAgent/awesome-claude-design. DESIGN.md files are unofficial community-curated interpretations, not affiliated with the named brands.
---

# getdesign.md Catalog

Index-only skill: this repo (`github.com/VoltAgent/awesome-claude-design`) does not ship the
`DESIGN.md` files itself — it's a directory of links to **getdesign.md**, where each brand's file
actually lives. Use `awesome-claude-design` first (30+ files stored locally, no fetch needed); use
this one when the brand you want isn't in that local set.

## How to use

1. Find the brand below, take its URL.
2. `WebFetch` the URL with a prompt like "return the full raw DESIGN.md content" — the page is a
   single markdown-ish spec (theme, color tokens, type scale, component rules, layout, elevation,
   do's/don'ts, responsive rules, agent prompts).
3. Apply it the same way as `awesome-claude-design`: extract tokens → CSS variables / Tailwind
   config, type scale → font stack, component rules → button/card/nav conventions, respect the
   do's/don'ts section.

No claude.ai/design account needed — Claude Code can read and apply the spec directly to a
codebase.

## Catalog (68 brands)

### AI & LLM Platforms
| Brand | URL |
|---|---|
| Claude | https://getdesign.md/claude/design-md |
| Cohere | https://getdesign.md/cohere/design-md |
| ElevenLabs | https://getdesign.md/elevenlabs/design-md |
| Minimax | https://getdesign.md/minimax/design-md |
| Mistral AI | https://getdesign.md/mistral.ai/design-md |
| Ollama | https://getdesign.md/ollama/design-md |
| OpenCode AI | https://getdesign.md/opencode.ai/design-md |
| Replicate | https://getdesign.md/replicate/design-md |
| RunwayML | https://getdesign.md/runwayml/design-md |
| Together AI | https://getdesign.md/together.ai/design-md |
| VoltAgent | https://getdesign.md/voltagent/design-md |
| xAI | https://getdesign.md/x.ai/design-md |

### Developer Tools & IDEs
| Brand | URL |
|---|---|
| Cursor | https://getdesign.md/cursor/design-md |
| Expo | https://getdesign.md/expo/design-md |
| Lovable | https://getdesign.md/lovable/design-md |
| Raycast | https://getdesign.md/raycast/design-md |
| Superhuman | https://getdesign.md/superhuman/design-md |
| Vercel | https://getdesign.md/vercel/design-md |
| Warp | https://getdesign.md/warp/design-md |

### Backend, Database & DevOps
| Brand | URL |
|---|---|
| ClickHouse | https://getdesign.md/clickhouse/design-md |
| Composio | https://getdesign.md/composio/design-md |
| HashiCorp | https://getdesign.md/hashicorp/design-md |
| MongoDB | https://getdesign.md/mongodb/design-md |
| PostHog | https://getdesign.md/posthog/design-md |
| Sanity | https://getdesign.md/sanity/design-md |
| Sentry | https://getdesign.md/sentry/design-md |
| Supabase | https://getdesign.md/supabase/design-md |

### Productivity & SaaS
| Brand | URL |
|---|---|
| Cal.com | https://getdesign.md/cal/design-md |
| Intercom | https://getdesign.md/intercom/design-md |
| Linear | https://getdesign.md/linear.app/design-md |
| Mintlify | https://getdesign.md/mintlify/design-md |
| Notion | https://getdesign.md/notion/design-md |
| Resend | https://getdesign.md/resend/design-md |
| Zapier | https://getdesign.md/zapier/design-md |

### Design & Creative Tools
| Brand | URL |
|---|---|
| Airtable | https://getdesign.md/airtable/design-md |
| Clay | https://getdesign.md/clay/design-md |
| Figma | https://getdesign.md/figma/design-md |
| Framer | https://getdesign.md/framer/design-md |
| Miro | https://getdesign.md/miro/design-md |
| Webflow | https://getdesign.md/webflow/design-md |

### Fintech & Crypto
| Brand | URL |
|---|---|
| Binance | https://getdesign.md/binance/design-md |
| Coinbase | https://getdesign.md/coinbase/design-md |
| Kraken | https://getdesign.md/kraken/design-md |
| Mastercard | https://getdesign.md/mastercard/design-md |
| Revolut | https://getdesign.md/revolut/design-md |
| Stripe | https://getdesign.md/stripe/design-md |
| Wise | https://getdesign.md/wise/design-md |

### E-commerce & Retail
| Brand | URL |
|---|---|
| Airbnb | https://getdesign.md/airbnb/design-md |
| Meta | https://getdesign.md/meta/design-md |
| Nike | https://getdesign.md/nike/design-md |
| Shopify | https://getdesign.md/shopify/design-md |

### Media & Consumer Tech
| Brand | URL |
|---|---|
| Apple | https://getdesign.md/apple/design-md |
| IBM | https://getdesign.md/ibm/design-md |
| NVIDIA | https://getdesign.md/nvidia/design-md |
| Pinterest | https://getdesign.md/pinterest/design-md |
| PlayStation | https://getdesign.md/playstation/design-md |
| SpaceX | https://getdesign.md/spacex/design-md |
| Spotify | https://getdesign.md/spotify/design-md |
| The Verge | https://getdesign.md/theverge/design-md |
| Uber | https://getdesign.md/uber/design-md |
| Vodafone | https://getdesign.md/vodafone/design-md |
| WIRED | https://getdesign.md/wired/design-md |

### Automotive
| Brand | URL |
|---|---|
| BMW | https://getdesign.md/bmw/design-md |
| Bugatti | https://getdesign.md/bugatti/design-md |
| Ferrari | https://getdesign.md/ferrari/design-md |
| Lamborghini | https://getdesign.md/lamborghini/design-md |
| Renault | https://getdesign.md/renault/design-md |
| Tesla | https://getdesign.md/tesla/design-md |

## The 9 sections every DESIGN.md follows

1. Visual Theme & Atmosphere
2. Color Palette & Roles (semantic tokens + hex)
3. Typography Rules (type scale, Google Fonts fallback)
4. Component Stylings (buttons, inputs, cards, nav + states)
5. Layout Principles (spacing scale, grid, whitespace rhythm)
6. Depth & Elevation (shadow tokens, surface hierarchy)
7. Do's and Don'ts (guardrails for new screens)
8. Responsive Behavior (breakpoints, touch targets)
9. Agent Prompt Guide (reusable prompts)

## Note

Community-curated, publicly-observable-pattern interpretations — not official brand assets, not
affiliated with the named companies. Use as inspiration, not a 1:1 clone, especially for
commercial projects.
