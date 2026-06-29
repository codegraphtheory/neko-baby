#!/usr/bin/env bash
set -euo pipefail

bin_dir="${XDG_BIN_HOME:-$HOME/.local/bin}"
profile_home="${HERMES_HOME:-$HOME/.hermes/profiles/neko-baby}"
launcher_src="$profile_home/scripts/neko-baby"

if [ ! -f "$launcher_src" ]; then
  launcher_src="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)/neko-baby"
fi

mkdir -p "$bin_dir"
cp "$launcher_src" "$bin_dir/neko-baby"
chmod +x "$bin_dir/neko-baby"
echo "Installed Neko Baby profile launcher: $bin_dir/neko-baby"
echo "This launcher applies Comic Mono and a compact 79-column live view only while neko-baby is running, then restores the previous Terminal.app font and terminal size."
