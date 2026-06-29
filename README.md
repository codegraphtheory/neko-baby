# Neko Baby

A maximum-kawaii neko Hermes Agent profile with candy-pink catgirl energy, bow-loaded terminal styling, nyan spinner motion, chibi mascot polish, and ship-ready command-parlor discipline.

Template lineage: built from [codegraphtheory/hermes-profile-template](https://github.com/codegraphtheory/hermes-profile-template).

## Install

```bash
hermes profile install github.com/codegraphtheory/neko-baby --alias --yes
~/.hermes/profiles/neko-baby/scripts/install_fonts.sh || true
neko-baby chat
```

For local development:

```bash
python3 -m pip install -r requirements.txt
make validate
hermes profile install . --name neko-baby-local --yes --force
hermes -p neko-baby-local chat
```


## If the shorthand command is missing

The shorthand command is created only when the install uses `--alias`. It writes a wrapper to `~/.local/bin/neko-baby`. If `neko-baby chat` is not found, run:

```bash
hermes profile install github.com/codegraphtheory/neko-baby --alias --yes --force
export PATH="$HOME/.local/bin:$PATH"
neko-baby profile
neko-baby chat
```

The profile still works without the shorthand:

```bash
hermes -p neko-baby chat
```

## Default model

Neko Baby defaults to OpenAI Codex via Hermes provider `openai-codex` with model `gpt-5.5` and base URL `https://chatgpt.com/backend-api/codex`. Users can still override the model after install through their Hermes config.

## Kawaii intensity

This profile intentionally runs at Level 3 kawaii: candy gradients, chibi neko mascot energy, bow and heart copy, paw-check language, nyan spinner phrases, pink terminal chrome, and a self-contained animated demo. Cute is allowed to be loud here: bows, hearts, plush mascot motion, and pink terminal chrome are the point.

## Focused catgirl TUI

Neko Baby now ships a profile-local Petdex mascot at `pets/neko-baby/` and enables it through `display.pet`. In the Hermes CLI this reflows the bottom TUI into a focused catgirl view: a live pink chibi neko sprite sits above the prompt, reacts while the agent thinks, waits, reviews, succeeds, or fails, and keeps the main input area visually anchored to the Neko Baby theme instead of a stock Hermes prompt.

The profile still uses standard Hermes runtime code for compatibility. Arbitrary panes and full custom terminal layouts require Hermes core support, but this profile uses the supported profile-local skin and pet surfaces so installs remain portable.

## Skin behavior

The profile config sets `display.skin: neko-baby`, and the skin file is installed at `skins/neko-baby.yaml` inside the Hermes profile. The skin uses Hermes CLI's real skin schema: banner colors, prompt symbol, spinner faces, response label, status bar colors, tool prefix, tool emojis, and banner art. It cannot force your terminal app's window background color, but the Hermes banner, prompt, status bar, spinner, response box, and command UI should be visibly pink neko themed.

## What it is

Neko Baby is a pink, girly, animated, nyan, ultra-kawaii profile for making agent work feel like a strawberry-milk catgirl command parlor without sacrificing correctness. It ships:

- `SOUL.md` with the full neko identity, tone, and operating style.
- `skills/neko-visual-polish/SKILL.md` for applying the theme to docs, terminal skins, and HTML artifacts.
- `docs/visual-theme.md` with tokens, animation rules, microcopy, and accessibility checks.
- `demo/index.html` with a self-contained animated pink neko preview.
- `skins/neko-baby.yaml` with a candy-pink terminal palette for Hermes skins where supported.
- `pets/neko-baby/` with a chibi catgirl Petdex spritesheet for the focused TUI mascot pane.

## Use it for

- Kawaii neko profile behavior.
- Pink animated docs and HTML prototypes.
- Cute but accessible terminal and web theme assets.
- Nyan microcopy that still gives exact command output.
- Flirty adult catgirl personality when the user wants that vibe.

## Design prompt

The mature prompt used to generate and refine this profile is preserved in:

```text
docs/profile-prompt.md
```

## Font stack

The web demo asks for a much cuter stack first: `Cherry Bomb One`, `Sniglet`, `Gaegu`, `Delius`, `Comic Neue`, `Baloo 2`, `Nunito`, and `SF Pro Rounded`. If those fonts are missing, it falls back to Inter, ui-rounded, ui-sans-serif, system-ui, and sans-serif. Run `scripts/install_fonts.sh` after install to add the cute font pack on macOS with Homebrew. Hermes terminal skins cannot force your terminal emulator font, so set your terminal app to one of the installed cute fonts if you want the live CLI to match the demo.

## Visual demo

Open the local demo file in a browser:

```bash
open demo/index.html
```

The demo has inline CSS, no external assets, no autoplay audio, and reduced-motion handling.

## Validate

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
hermes profile install . --name neko-baby-local --yes --force
```

## Release discipline

For behavior, config, docs, skills, scripts, demo, or manifest changes:

1. Bump `version` in `distribution.yaml`.
2. Add a matching `CHANGELOG.md` entry.
3. Run `make validate` and a Hermes smoke install before release.
