#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

python3 scripts/validate_profile.py .
PYTHONDONTWRITEBYTECODE=1 python3 -m py_compile scripts/*.py

if ! command -v hermes >/dev/null 2>&1; then
  echo "Hermes CLI not found. Skipping install smoke test after validation passed."
  exit 0
fi

hermes_bin="$(command -v hermes)"
smoke_root="$(mktemp -d /tmp/neko-baby-smoke.XXXXXX)"
export HOME="$smoke_root/home"
export HERMES_HOME="$smoke_root/hermes-home"
export PATH="$HOME/.local/bin:$smoke_root/bin:/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin"
mkdir -p "$HOME" "$smoke_root/bin"
ln -sf "$hermes_bin" "$smoke_root/bin/hermes"

"$hermes_bin" profile install . --alias --yes --force

test -f "$HERMES_HOME/profiles/neko-baby/SOUL.md"
test -f "$HERMES_HOME/profiles/neko-baby/distribution.yaml"
test -f "$HERMES_HOME/profiles/neko-baby/skins/neko-baby.yaml"
test -x "$HOME/.local/bin/neko-baby"

neko-baby profile >/tmp/neko-baby-alias-smoke.out
grep -q "Active profile: neko-baby" /tmp/neko-baby-alias-smoke.out

hermes_python="$($hermes_bin --version >/dev/null 2>&1; python3 - <<'PY'
from pathlib import Path
import re, shutil
wrapper = Path(shutil.which('hermes') or '').expanduser()
text = wrapper.read_text(encoding='utf-8', errors='ignore') if wrapper.exists() else ''
match = re.search(r'exec "([^"]*/venv/bin/hermes)"', text)
if match:
    candidate = Path(match.group(1)).with_name('python')
    if candidate.exists():
        print(candidate)
        raise SystemExit
if wrapper.exists():
    first = text.splitlines()[0] if text else ''
    if first.startswith('#!') and 'python' in first:
        print(first[2:])
        raise SystemExit
print('python3')
PY
)"
HERMES_HOME="$HERMES_HOME/profiles/neko-baby" "$hermes_python" - <<'PY'
from hermes_cli.config import load_config
from hermes_cli.skin_engine import init_skin_from_config, get_active_skin
cfg = load_config()
init_skin_from_config(cfg)
skin = get_active_skin()
assert skin.name == 'neko-baby', skin.name
assert skin.get_branding('agent_name') == 'Neko Baby'
assert skin.get_branding('prompt_symbol') == '♡ฅ'
assert skin.get_color('banner_border') == '#ff4fb8'
assert skin.banner_logo and skin.banner_hero
assert 'strawberry milk' in skin.banner_logo
assert 'pink paws' in skin.banner_hero
print('Skin activation smoke passed: neko-baby')
PY

echo "Hermes profile install, alias, and skin smoke passed: $HERMES_HOME/profiles/neko-baby"
