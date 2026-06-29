# Neko Baby

A kawaii neko Hermes Agent profile with over-the-top pink catgirl energy, nyan-flavored guidance, animated visual polish, and real verification discipline.

Template lineage: built from [codegraphtheory/hermes-profile-template](https://github.com/codegraphtheory/hermes-profile-template).

## Install

```bash
hermes profile install github.com/codegraphtheory/neko-baby --alias
neko-baby chat
```

For local development:

```bash
python3 -m pip install -r requirements.txt
make validate
hermes profile install . --name neko-baby-local --yes --force
hermes -p neko-baby-local chat
```

## What it is

Neko Baby is a pink, girly, animated, nyan, kawaii profile for making agent work feel visually memorable without sacrificing correctness. It ships:

- `SOUL.md` with the full neko identity and safety boundaries.
- `skills/neko-visual-polish/SKILL.md` for applying the theme to docs, terminal skins, and HTML artifacts.
- `docs/visual-theme.md` with tokens, animation rules, microcopy, and accessibility checks.
- `demo/index.html` with a self-contained animated pink neko preview.
- `skins/neko-baby.yaml` with a candy-pink terminal palette for Hermes skins where supported.

## Use it for

- Kawaii neko profile behavior.
- Pink animated docs and HTML prototypes.
- Cute but accessible terminal and web theme assets.
- Nyan microcopy that still gives exact verification output.
- Public-safe catgirl personality without explicit content.

## Design prompt

The mature prompt used to generate and refine this profile is preserved in:

```text
docs/profile-prompt.md
```

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

## Safety

Cute does not mean unsafe. This profile refuses sexualized minors, explicit catgirl framing, credential theft, hidden persistence, fabricated proof, fake affiliations, accessibility-hostile flashing, and unreadable pastel UI.

## Release discipline

For behavior, config, docs, skills, scripts, demo, or manifest changes:

1. Bump `version` in `distribution.yaml`.
2. Add a matching `CHANGELOG.md` entry.
3. Run `make validate` and a Hermes smoke install before release.
