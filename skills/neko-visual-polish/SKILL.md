---
name: neko-visual-polish
description: Apply the Neko Baby kawaii catgirl visual theme to docs, HTML, CSS, terminal skins, and profile assets while preserving readability and real checks.
version: 0.1.0
metadata:
  hermes:
    tags: [kawaii, neko, catgirl, pink, animation, accessibility, hermes-profile]
---

# Neko Visual Polish

Use this skill whenever the user asks to make an artifact cute, kawaii, neko, catgirl, pink, girly, nyan, animated, or visually hotter.

## Product goal first

Before decorating, write the real job in one sentence:

```text
This artifact helps [user] do [job] with [primary action].
```

Cute styling must support that job.

## Theme tokens

Use these tokens unless the host app already has a stronger design system:

```css
:root {
  --neko-bg: #fff4fb;
  --neko-bg-deep: #2a0f24;
  --neko-surface: rgba(255, 255, 255, 0.78);
  --neko-ink: #321426;
  --neko-muted: #7a4d68;
  --neko-hot-pink: #ff3fa4;
  --neko-bubblegum: #ff8fd3;
  --neko-blush: #ffd6ea;
  --neko-lavender: #c7a7ff;
  --neko-mint: #a8f5d1;
  --neko-sky: #95dcff;
  --neko-butter: #fff09a;
  --neko-border: #ffb7df;
  --neko-shadow: 0 24px 80px rgba(255, 63, 164, 0.26);
  --neko-radius-card: 30px;
  --neko-radius-pill: 999px;
}
```

## Motifs

Prefer:

- Cat ears on one logo, badge, or hero frame.
- Paw pads for bullets, status dots, or loading steps.
- Bows for section labels or badges.
- Whisker dividers between sections.
- Nyan rainbow trails for progress or success.
- Floating hearts and stars in decorative backgrounds.
- Chibi mascot language, flirty catgirl accents when wanted, and plush command-parlor copy.

Avoid:

- Ears, paws, bows, hearts, and rainbows on every component at once.
- Pastel text on pastel backgrounds.
- Branded character clones.
- Autoplay audio.
- Flashing rainbow loops.

## Motion recipe

Use short, soft animations:

- `floaty`: 5 to 8 seconds, alternate ease-in-out.
- `pawStep`: 1 to 1.6 seconds, small vertical movement.
- `sparkle`: 1.8 to 3 seconds, opacity and scale.
- `rainbowSlide`: 3 to 8 seconds, background-position only.
- `tailSwish`: 2 to 4 seconds, small rotation.

Always include:

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.001ms !important;
    animation-iteration-count: 1 !important;
    scroll-behavior: auto !important;
  }
}
```

## Microcopy

Use cute language sparingly.

Good:

- `Purrfect. Saved.`
- `Nyan progress trail is complete.`
- `The kitten found a contrast issue.`
- `Paw-check passed.`

Bad:

- `uwu nya nya nya nya`
- Any joke that hides an error.

## Accessibility checklist

Run this before finishing:

1. Text contrast is readable against all pink surfaces.
2. Buttons and links have visible focus states.
3. Tap targets are at least 44px tall where practical.
4. Decorative layers use `pointer-events: none` when floating over content.
5. `prefers-reduced-motion` is present.
6. There is no autoplay audio.
7. Mobile layouts avoid horizontal overflow.
8. Danger and error states use plain language.

## Verification snippet for HTML artifacts

```bash
python3 - <<'PY'
from pathlib import Path
p = Path('demo/index.html')
text = p.read_text(encoding='utf-8')
checks = {
    'file exists': p.exists(),
    'has neko tokens': '--neko-' in text,
    'has reduced motion': 'prefers-reduced-motion' in text,
    'has viewport': 'name="viewport"' in text,
    'no autoplay': 'autoplay' not in text.lower(),
}
for name, ok in checks.items():
    print(f'{name}: {"OK" if ok else "FAIL"}')
raise SystemExit(0 if all(checks.values()) else 1)
PY
```
