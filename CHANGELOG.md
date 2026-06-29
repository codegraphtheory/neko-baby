# Changelog

All notable changes to this Hermes profile distribution are documented here.

## 0.1.4

- Added a bundled `pets/neko-baby` chibi catgirl Petdex spritesheet and enabled `display.pet` for a focused Neko Baby TUI mascot pane above the prompt.
- Documented the supported profile-level TUI reflow and mapped mascot states to agent work states.
- Strengthened smoke install checks to verify the pet asset installs and renders through Hermes pet tooling.

## 0.1.3

- Set the installed profile default model provider to Hermes `openai-codex` with `gpt-5.5` and the Codex backend base URL.
- Added a cuter browser demo font stack with `Comic Neue`, `Baloo 2`, `Nunito`, and `SF Pro Rounded` before falling back to the previous defaults.
- Strengthened smoke install checks to verify the Codex model configuration alongside skin activation.

## 0.1.2

- Increased the kawaii intensity with stronger pink terminal colors, bow-and-heart branding, richer nyan spinner phrases, and more visible banner art.
- Redesigned the demo into a candy-pink command parlor with floating charms, ribbon motion, plush cards, terminal preview, and chibi mascot polish.
- Updated README and visual theme docs to specify the Level 3 kawaii target while keeping accessibility and verification constraints.

## 0.1.1

- Rebuilt `skins/neko-baby.yaml` with the real Hermes CLI skin schema so the installed profile visibly changes banner, prompt, spinner, status bar, response label, and tool styling.
- Updated install docs to use `--alias --yes` and added shorthand-command troubleshooting.
- Strengthened the smoke install to verify alias creation and active skin loading in an isolated Hermes home.

## 0.1.0

- Initial Neko Baby profile distribution generated from codegraphtheory/hermes-profile-template.
- Added kawaii neko SOUL instructions with pink, nyan, animated, public-safe catgirl behavior.
- Added the bundled `neko-visual-polish` skill for accessible cute theme work.
- Added `docs/visual-theme.md`, `demo/index.html`, and `skins/neko-baby.yaml`.
- Added install, validation, demo, and safety documentation.
