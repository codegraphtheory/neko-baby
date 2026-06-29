# Neko Baby Visual Theme

This profile uses a cute, accessible, over-the-top pink neko visual system for docs, demos, terminal previews, and generated examples.

## Design goal

This theme helps builders feel like they are working inside a candy-pink neko control room while still being able to read, click, validate, and ship.

## Palette

| Token | Hex | Use |
| --- | --- | --- |
| `--neko-bg` | `#fff4fb` | Main blush background |
| `--neko-bg-deep` | `#2a0f24` | Dark cherry panels |
| `--neko-ink` | `#321426` | Primary readable text |
| `--neko-muted` | `#7a4d68` | Secondary text |
| `--neko-hot-pink` | `#ff3fa4` | Primary action and glow |
| `--neko-bubblegum` | `#ff8fd3` | Soft action surfaces |
| `--neko-blush` | `#ffd6ea` | Cards and backgrounds |
| `--neko-lavender` | `#c7a7ff` | Secondary accent |
| `--neko-mint` | `#a8f5d1` | Success accent |
| `--neko-sky` | `#95dcff` | Nyan rainbow accent |
| `--neko-butter` | `#fff09a` | Stars and highlights |

## Motifs

- Cat ears for hero cards and logo frames.
- Paw pads for bullets and status markers.
- Bows for labels and badges.
- Whisker dividers for section breaks.
- Rainbow trails for progress and success.
- Floating hearts, pixel stars, yarn loops, bells, and sparkle dust as background art.

## Animation rules

- Keep motion soft, short, and decorative.
- Use transform and opacity when possible.
- Keep form fields, primary buttons, and error messages stable.
- Respect `prefers-reduced-motion: reduce`.
- Never use autoplay audio.
- Do not use flashing rainbow effects.

## Agent microcopy examples

- `Purrfect. Validation passed.`
- `Nyan trail complete. The repo is installable.`
- `The kitten found one contrast issue.`
- `Paw-check the smoke install before release.`

## Safety boundaries

- Mascot and catgirl references stay age-neutral, non-explicit, and safe for public repos.
- Do not copy branded characters or exact meme artwork.
- Do not fake community links, audits, testimonials, screenshots, or install metrics.
- For security, legal, finance, destructive commands, or privacy topics, use plain language.

## Verification

Run these checks after substantive changes:

```bash
python3 scripts/validate_profile.py .
python3 - <<'PY'
from pathlib import Path
p = Path('demo/index.html')
text = p.read_text(encoding='utf-8')
checks = {
    'demo exists': p.exists(),
    'neko tokens': '--neko-' in text,
    'reduced motion': 'prefers-reduced-motion' in text,
    'viewport': 'name="viewport"' in text,
    'no autoplay': 'autoplay' not in text.lower(),
}
for name, ok in checks.items():
    print(f'{name}: {"OK" if ok else "FAIL"}')
raise SystemExit(0 if all(checks.values()) else 1)
PY
```
