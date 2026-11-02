#!/bin/bash
# Put Kang Eyes Agent on GitHub as a PRIVATE repository (kang-blanc-tech/kang-eyes-agent) and publish release
# 1.6.1.1 with the staff zip attached. Run it once, yourself, from Terminal:
#     bash ~/Desktop/kang-eyes-agent/scripts/publish-private-repo.sh
# Safe to re-run: every step checks whether it is already done.
set -euo pipefail
cd "$(dirname "$0")/.."
REPO=kang-blanc-tech/kang-eyes-agent
VERSION=1.6.1.1

# the original project stays reachable as "upstream", for taking its future fixes
if git remote get-url origin 2>/dev/null | grep -q "Panniantong"; then git remote rename origin upstream; fi

if ! gh repo view "$REPO" >/dev/null 2>&1; then
  gh repo create "$REPO" --private \
    --description "Kang Eyes Agent: our version of Agent Reach 1.6.1 (MIT). Read-only internet access for AI agents."
fi
git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$REPO.git"
git push -u origin kang-eyes-agent:main

if ! gh release view "v$VERSION" --repo "$REPO" >/dev/null 2>&1; then
  gh release create "v$VERSION" "dist/Kang Eyes Agent/kang-eyes.zip" "dist/Kang-Eyes-Agent-$VERSION.zip" \
    --repo "$REPO" --title "Kang Eyes Agent $VERSION" --notes-file KANG-EYES-CHANGES.md
fi
gh repo view "$REPO" --json url,visibility --jq '"Done: \(.url) (\(.visibility))"'
