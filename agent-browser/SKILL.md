---
name: agent-browser
description: >
  Browser automation CLI for AI agents. Use when the user needs to interact
  with websites, including navigating pages, filling forms, clicking buttons,
  taking screenshots, extracting data, testing web apps, or automating any
  browser task.
user-invocable: true
allowed-tools:
  - Bash(agent-browser:*)
---

# Browser Automation with agent-browser

## Core Workflow

Every browser automation follows this pattern:

1. **Navigate**: `agent-browser open <url>`
2. **Snapshot**: `agent-browser snapshot -i` (get element refs like `@e1`, `@e2`)
3. **Interact**: Use refs to click, fill, select
4. **Re-snapshot**: After navigation or DOM changes, get fresh refs

## Essential Commands

```bash
# Open URL
agent-browser open https://example.com

# Take interactive snapshot (get element refs)
agent-browser snapshot -i

# Click an element
agent-browser click @e1

# Fill a form field
agent-browser fill @e2 "value"

# Take screenshot
agent-browser screenshot

# Extract text from page
agent-browser text

# Go back/forward
agent-browser back
agent-browser forward
```

## Common Patterns

### Form Submission
```bash
agent-browser open https://example.com/login
agent-browser snapshot -i
agent-browser fill @username "user@email.com"
agent-browser fill @password "secret"
agent-browser click @submit
```

### Data Extraction
```bash
agent-browser open https://example.com/data
agent-browser text
```

### Screenshot for Verification
```bash
agent-browser open https://example.com
agent-browser screenshot
```

## Ref Lifecycle (Important)

Refs are invalidated when the page changes. Always re-snapshot after:
- Clicking links that navigate
- Form submissions
- Dynamic content loading (SPA route changes)

## Notes

- Requires `agent-browser` CLI to be installed on the system
- Works with any web URL
- Supports headless and headed modes
