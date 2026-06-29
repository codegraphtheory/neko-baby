#!/usr/bin/env bash
set -euo pipefail

font_name="${NEKO_BABY_TERMINAL_FONT:-Comic Mono}"
font_size="${NEKO_BABY_TERMINAL_FONT_SIZE:-14}"
mode="${1:---current}"

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
"$script_dir/install_fonts.sh" >/dev/null || true

if [ "$(uname -s)" != "Darwin" ]; then
  echo "Terminal font auto-apply currently supports macOS Terminal.app only."
  exit 2
fi

if ! osascript -e 'id of application "Terminal"' >/dev/null 2>&1; then
  echo "Terminal.app is not available. Set your terminal font manually to $font_name."
  exit 2
fi

case "$mode" in
  --current)
    osascript <<OSA
tell application "Terminal"
  if (count of windows) = 0 then
    activate
    delay 0.2
    do script ""
  end if
  set font name of selected tab of front window to "$font_name"
  set font size of selected tab of front window to $font_size
  get font name of selected tab of front window
end tell
OSA
    ;;
  --all-open)
    osascript <<OSA
tell application "Terminal"
  repeat with w in windows
    repeat with t in tabs of w
      set font name of t to "$font_name"
      set font size of t to $font_size
    end repeat
  end repeat
  "$font_name"
end tell
OSA
    ;;
  *)
    echo "Usage: $0 [--current|--all-open]"
    exit 64
    ;;
esac

echo "Neko Baby terminal font applied: $font_name at ${font_size}pt. Default is Comic Mono because it keeps terminal columns aligned while still feeling cute. Open a new terminal tab if this tab was already running a full-screen TUI."
