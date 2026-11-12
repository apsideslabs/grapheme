# Grapheme — "Night Press" redesign

A re-skin of the existing static blog onto the visual system you pointed at
(near-black canvas, orange accent, yellow action button, flat fills, 1px rules,
arrow bullets, tight gutters) — adapted for a publication rather than a sales page.

Nothing about the site's architecture changed: still plain HTML + one CSS file +
one JS file, no build step, no dependencies, no framework. Every existing class
name still works, so all 20+ pages inherit the new look without markup rewrites.

## What changed

| File | Change |
|---|---|
| `assets/style.css` | Rewritten. Same class names, new tokens and components. |
| `assets/main.js` | Adds a dismissible sticky subscribe bar; reveal failsafe; dark theme colour. |
| `index.html` | New masthead (kicker, display name, actions, spec chips), trust plate, "What this is" arrow list. |
| `*.html` (all pages) | `data-theme="dark"` default, `theme-color` #131313, stylesheet `?v=6`. |

## Palette

| Token | Dark (default) | Ivory (alternate) | Job |
|---|---|---|---|
| `--canvas` | `#131313` | `#FAF8F3` | Page ground |
| `--void` | `#0A0A0A` | `#F2EDE3` | Bands: CTA, footer |
| `--surface` | `#1C1C1C` | `#FFFFFF` | Cards, chips, sticky bar |
| `--line` / `--line-2` | `#2A2A2A` / `#3A3A3A` | `#E6E1D6` / `#D6D0C3` | 1px rules, borders |
| `--ink` / `--ink-2` | `#F7F5F1` / `#D8D4CD` | `#17191D` / `#34373D` | Text |
| `--muted` / `--faint` | `#9E9A94` / `#74706B` | `#6E6B66` / `#8E8A84` | Secondary text |
| `--accent` | `#FF6A00` | `#E8500F` | Emphasis, arrows, icons, tags |
| `--action` | `#FFF116` | `#FFF116` | Primary button only |

Contrast on the dark canvas: accent 6.2:1, body 16.7:1, black on yellow 16.8:1.

## Components

- **Spec chips** (`.specgrid` / `.spec`) — the 2×2 (mobile) / 4-across (desktop)
  bordered grid of icon + label + value, used in the masthead for latest post,
  read time, topics and cost.
- **Arrow bullets** (`.arrows`, and every `ul` inside `.prose`) — orange `→`
  markers, bold lead phrase in accent.
- **Trust plate** (`.trust-strip`) — the single light `#F7F5F1` block on the dark
  page, carrying four plain facts about how the site is built.
- **Sticky subscribe bar** (`.subscribe-bar`) — injected by `main.js` after 420px
  of scroll, dismissible, remembered in `localStorage` under `grapheme-sb`.
  Article pages link `../feed.xml` automatically.
- **Type** — Inter for UI, headings, labels and cards (700/800, −0.02 to −0.04em
  tracking); Newsreader serif reserved for long-form `.prose` body only, so
  articles still read like a publication. Drop cap in accent.
- **Radii** — 10px buttons, 12px chips, 14px cards. No shadows on the dark theme;
  separation comes from fills and 1px borders.

## Light theme

Still available from the header toggle and remembered. It keeps the geometry and
the orange/yellow roles; only the ground flips to ivory.

## Brand assets on dark

`logo.svg` is single-colour ink, so it is inverted in dark theme. The G monogram
and the Apsides Labs wordmark contain their own colours (red/orange, navy/blue),
so they are placed on a light plate instead of being inverted — same trick as the
"featured in" strip on the reference page.
