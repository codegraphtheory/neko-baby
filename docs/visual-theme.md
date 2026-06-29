# Neko Baby Visual Theme

This profile uses a cute, accessible, over-the-top pink neko visual system for docs, demos, terminal previews, and generated examples.

## Design goal

This theme helps builders feel like they are working inside a candy-pink neko control room while still being able to read, click, validate, and ship.

## Kawaii intensity target

Level 3: full theme. Use obvious bows, paw pads, hearts, strawberry-milk pink, chibi mascot cues, nyan rainbow trails, cute terminal labels, and animated sparkle energy. Keep controls readable and preserve reduced-motion support.

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

## Typography

Use a very cute rounded display stack for browser artifacts: `Cherry Bomb One`, `Sniglet`, `Gaegu`, `Delius`, `Comic Neue`, `Baloo 2`, `Nunito`, `SF Pro Rounded`, then the fallback stack `Inter`, `ui-rounded`, `ui-sans-serif`, `system-ui`, `sans-serif`. For terminal previews, try `Comic Neue`, `Gaegu`, `Comic Code`, or `Fira Code` before standard monospace fallbacks. The profile includes `scripts/install_fonts.sh` to install the cute font pack on macOS with Homebrew.

Hermes CLI skins do not set the terminal emulator font directly. The profile ships `scripts/install_launcher.sh` and `scripts/neko-baby` for macOS Terminal.app. The launcher applies `Comic Mono` only while the `neko-baby` profile is running, then restores the previous Terminal.app font. Comic Mono is monospaced, so terminal columns stay aligned. Other terminal emulators still need manual font selection.

## Motifs

- Cat ears for hero cards and logo frames.
- Paw pads for bullets and status markers.
- Bows for labels and badges.
- Whisker dividers for section breaks.
- Rainbow trails for progress and success.
- Floating hearts, pixel stars, yarn loops, bells, lace borders, plush cards, strawberry-milk badges, and sparkle dust as background art.

## Animation rules

- Keep motion soft, short, and decorative.
- Use transform and opacity when possible.
- Keep form fields, primary buttons, and error messages stable.
- Respect `prefers-reduced-motion: reduce`.
- Never use autoplay audio.
- Do not use flashing rainbow effects.

## Agent microcopy examples

- `Purrfect. Validation passed. Pink paws approved.`
- `Nyan trail complete. The repo is installable and the bow is tied.`
- `The kitten found one contrast issue.`
- `Paw-check the smoke install before release.`

## Public copy notes

- Do not copy branded characters or exact meme artwork.
- Keep public-facing claims source-grounded.
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


## Focused TUI layout

The installed profile enables `display.pet` with the bundled `neko-baby` pet. Hermes renders this as a compact live half-block sprite above the prompt in the CLI TUI. Use this as the supported profile-level reflow: the mascot pane provides a focused catgirl workbench without patching Hermes core. Keep `scale` and `unicode_cols` conservative so the opening view fits common terminal heights.

Pet states map to work states:

- Idle: calm chibi neko with hearts.
- Thinking/running: paw motion and tail motion.
- Waiting: soft hearts while the user needs to answer.
- Review: tiny checklist panel.
- Failed: sad face and recovery posture.
- Done: jump or wave reaction.

## Hermes CLI skin mapping

The actual terminal skin lives at `skins/neko-baby.yaml` and uses Hermes CLI skin keys, not generic terminal color keys. Important fields:

- `colors.banner_border`, `banner_title`, `banner_accent`, `banner_text`, and `banner_dim` for startup panels.
- `colors.prompt`, `input_rule`, and `response_border` for the main conversation frame.
- `colors.status_bar_*`, `completion_menu_*`, and `selection_bg` for TUI surfaces.
- `branding.agent_name`, `welcome`, `goodbye`, `response_label`, `prompt_symbol`, and `help_header` for visible copy.
- `spinner.waiting_faces`, `thinking_faces`, `thinking_verbs`, and `wings` for nyan motion in the CLI.
- `banner_logo` and `banner_hero` for the biggest first-impression theme hit.

A profile-local skin works when Hermes is launched through that profile because `get_hermes_home()` resolves to `~/.hermes/profiles/<name>/`, and the skin engine reads `<profile>/skins/<skin>.yaml`.
