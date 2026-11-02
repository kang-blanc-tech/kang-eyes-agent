#!/bin/bash
# Kang Eyes Agent: the staff installer. Double-click it (the first time: right-click > Open).
# It installs the `kang-eyes` command from kang-eyes.zip beside it and gives every AI app on this Mac the
# `kang-eyes` skill. Read-only tool: it never posts, never logs in for you, never asks for a password.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
ZIP="$HERE/kang-eyes.zip"
pause() { read -r -p "Press Return to close." _ || true; }

echo "Kang Eyes Agent installer"
echo
if [ ! -f "$ZIP" ]; then
  echo "kang-eyes.zip is missing: keep it in the same folder as this installer."
  pause; exit 1
fi

export PATH="$HOME/.local/bin:$PATH"
if ! command -v uv >/dev/null 2>&1; then
  echo "This needs 'uv', a small tool that installs command-line programs (no admin password)."
  read -r -p "Install uv now from astral.sh? [y/N] " answer || answer=""
  case "$answer" in
    y|Y) curl -LsSf https://astral.sh/uv/install.sh | sh ;;
    *) echo "Stopped: nothing was installed."; pause; exit 1 ;;
  esac
  export PATH="$HOME/.local/bin:$PATH"
fi

uv tool install --force "$ZIP"
uv tool update-shell >/dev/null 2>&1 || true
AGENT_REACH_LANG="${AGENT_REACH_LANG:-en}" kang-eyes setup --text

echo
echo "Done. Ask your AI: \"How is Kang Eyes doing?\""
pause
