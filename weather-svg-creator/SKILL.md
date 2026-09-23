---
name: weather-svg-creator
description: Creates an SVG weather card showing the current temperature for Dubai. Writes the SVG to orchestration-workflow/weather.svg and updates orchestration-workflow/output.md.
user-invocable: false
allowed-tools:
  - Read
  - Write
---

# Weather SVG Creator Skill

Creates a visual SVG weather card for Dubai, UAE and writes the output files.

## Task

You will receive a temperature value and unit (Celsius or Fahrenheit) from the calling context. Create an SVG weather card and write both the SVG and a markdown summary.

## Instructions

1. **Create SVG** — Build a self-contained SVG weather card using the template below, replacing placeholders with actual values
2. **Write SVG file** — Write to `orchestration-workflow/weather.svg`
3. **Write summary** — Write to `orchestration-workflow/output.md` with a markdown summary

## SVG Template

```svg
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="250" viewBox="0 0 400 250">
  <defs>
    <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#1a1a2e;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#16213e;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect width="400" height="250" rx="20" fill="url(#bg)"/>
  <text x="200" y="50" font-family="Arial, sans-serif" font-size="18" fill="#a0aec0" text-anchor="middle">Dubai, UAE 🇦🇪</text>
  <text x="200" y="140" font-family="Arial, sans-serif" font-size="72" fill="#f6e05e" text-anchor="middle" font-weight="bold">{{TEMP}}°{{UNIT}}</text>
  <text x="200" y="185" font-family="Arial, sans-serif" font-size="16" fill="#68d391" text-anchor="middle">Current Temperature</text>
  <text x="200" y="230" font-family="Arial, sans-serif" font-size="12" fill="#718096" text-anchor="middle">Source: Open-Meteo API</text>
</svg>
```

Replace `{{TEMP}}` with the numeric temperature and `{{UNIT}}` with `C` or `F`.

## Output Template (output.md)

```markdown
# Dubai Weather Report

**Location**: Dubai, UAE
**Temperature**: {{TEMP}}°{{UNIT_FULL}}
**Source**: Open-Meteo API (free, no API key required)

SVG card saved to: `orchestration-workflow/weather.svg`
```

## Rules

- Use the exact temperature value and unit provided — do not re-fetch or modify
- The SVG must be self-contained and valid
- Both output files go in the `orchestration-workflow/` directory
- Create the `orchestration-workflow/` directory if it does not exist
