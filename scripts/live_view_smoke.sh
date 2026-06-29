#!/usr/bin/env bash
set -euo pipefail
session="neko-baby-live-smoke"
out="${1:-/tmp/neko-baby-live-smoke.txt}"

tmux kill-session -t "$session" 2>/dev/null || true
tmux new-session -d -s "$session" -x 100 -y 30 'stty cols 79; neko-baby chat'
sleep 6
tmux capture-pane -t "$session" -p -S -80 > "$out"
tmux kill-session -t "$session" 2>/dev/null || true

python3 - "$out" <<'PY'
from pathlib import Path
import sys
text = Path(sys.argv[1]).read_text(errors='ignore')
checks = {
    'compact banner': 'Available Tools' not in text and 'Available Skills' not in text,
    'pet visible': '▀' in text or '▄' in text,
    'neko prompt': '♡ฅ' in text,
    'neko welcome': 'Neko Baby is online' in text,
}
for name, ok in checks.items():
    print(f'{name}: {"OK" if ok else "FAIL"}')
if not all(checks.values()):
    raise SystemExit(1)
PY
