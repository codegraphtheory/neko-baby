#!/usr/bin/env bash
set -euo pipefail

fonts=(
  font-cherry-bomb-one
  font-sniglet
  font-gaegu
  font-delius
  font-comic-neue
  font-baloo-2
)

families=(
  "Cherry Bomb One"
  "Sniglet"
  "Gaegu"
  "Delius"
  "Comic Neue"
  "Baloo 2"
)

have_family() {
  local family="$1"
  if command -v fc-match >/dev/null 2>&1; then
    local match
    match="$(fc-match "$family" 2>/dev/null || true)"
    case "$(printf '%s' "$match" | tr '[:upper:]' '[:lower:]')" in
      *"$(printf '%s' "$family" | tr '[:upper:]' '[:lower:]')"*) return 0 ;;
    esac
  fi
  find "$HOME/Library/Fonts" "/Library/Fonts" -maxdepth 2 -iname "*${family// /}*" -o -iname "*$family*" 2>/dev/null | grep -q .
}

missing=()
for i in "${!fonts[@]}"; do
  if ! have_family "${families[$i]}"; then
    missing+=("${fonts[$i]}")
  fi
done

if [ "${1:-}" = "--check" ]; then
  if [ "${#missing[@]}" -eq 0 ]; then
    echo "Cute font pack already installed."
    exit 0
  fi
  printf 'Missing cute font casks: %s
' "${missing[*]}"
  exit 1
fi

if [ "${#missing[@]}" -eq 0 ]; then
  echo "Cute font pack already installed."
  exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required to install the Neko Baby font pack automatically."
  echo "Missing casks: ${missing[*]}"
  echo "Install Homebrew or install these fonts manually, then rerun this script."
  exit 2
fi

echo "Installing Neko Baby cute font pack: ${missing[*]}"
brew install --cask "${missing[@]}"

echo "Cute font pack installed. Restart your browser or terminal app if the new fonts do not appear immediately."
