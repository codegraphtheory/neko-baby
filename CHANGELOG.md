# Changelog

All notable changes to this Hermes profile distribution are documented here.

## 0.1.10

- Updated the profile launcher to force a scoped 79-column compact live view so the actual pet pane appears in the opening screen.
- Regenerated the VHS demo from a real `neko-baby chat` startup instead of the scripted showcase.
- Added a live tmux smoke script that verifies the compact banner, live pet glyphs, Neko prompt, and welcome copy.

## 0.1.9

- Shortened the opening banner and reduced the pet pane size so the initial Neko Baby view fits common terminal screens.
- Added a VHS terminal demo tape plus generated GIF showcasing the compact banner, Comic Mono launcher, pet pane, spinner flavor, tool labels, and neko prompt.

## 0.1.8

- Added a profile-specific `neko-baby` launcher that applies Comic Mono only while the Neko Baby profile is running, then restores the previous Terminal.app font.
- Switched the live terminal font target to monospaced Comic Mono so spacing and columns stay aligned.
- Updated font install and troubleshooting docs to keep font behavior restricted to the Neko Baby profile.

## 0.1.7

- Switched the live Terminal.app font helper default from `Cherry Bomb One` to the softer, more readable `Gaegu` at 16pt after real terminal testing showed Cherry Bomb One was too bold.
- Documented how to opt into the bolder headline font and how to switch back to the softer default.

## 0.1.6

- Added `scripts/apply_terminal_font.sh` to apply the super-cute `Cherry Bomb One` font to the active macOS Terminal.app tab or all open tabs.
- Updated install and troubleshooting docs so users know font installation alone does not change an already-open terminal emulator font.

## 0.1.5

- Reworked public copy to sound confident, plush, and welcoming instead of defensive.
- Updated Neko Baby personality to allow consensual adult flirtation while preserving clear boundaries for illegal or non-consensual content.
- Upgraded the demo to a much cuter font stack: Cherry Bomb One, Sniglet, Gaegu, Delius, Comic Neue, Baloo 2, Nunito, and SF Pro Rounded with fallbacks.
- Added `scripts/install_fonts.sh` to install the cute font pack on macOS via Homebrew when fonts are missing.

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
- Added kawaii neko SOUL instructions with pink, nyan, animated catgirl behavior.
- Added the bundled `neko-visual-polish` skill for accessible cute theme work.
- Added `docs/visual-theme.md`, `demo/index.html`, and `skins/neko-baby.yaml`.
- Added install, validation, demo, and theme documentation.
