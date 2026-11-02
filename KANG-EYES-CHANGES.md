# Kang Eyes Agent: what changed from Agent Reach

Kang Eyes Agent is a modified version of **Agent Reach 1.6.1** by Panniantong / Agent Eyes
(<https://github.com/Panniantong/Agent-Reach>, MIT License, "Copyright (c) 2025 Agent Eyes").
The MIT licence lets anyone use, copy, modify and redistribute it, as long as the original copyright notice and
the licence text stay with every copy. They are kept, unchanged, in `LICENSE`; our own line is added below them.

This file lists every change, so anyone can tell our work from the original.

## 1.6.1.1 (2026-11-02), based on Agent Reach 1.6.1 (commit 7a38047)

**Name.** The product is **Kang Eyes Agent**; the command is `kang-eyes`; the AI skill is `kang-eyes`; its data
folder is `~/.kang-eyes/`. This lets it sit next to an original Agent Reach install without either touching the
other's files, skill or logins. (The internal Python package keeps its original name, `agent_reach`, so future
upstream fixes merge cleanly.)

**Updates come from us.** `kang-eyes update` and the new-version notice read releases from
`kang-blanc-tech/kang-eyes-agent`, never the original project, so a staff Mac only ever gets a version Kang
released.

**English by default.** The skill and the reports are written in English unless the environment asks for Chinese
(`AGENT_REACH_LANG=zh`). Agent Reach defaults to Chinese whenever no English language is set, which is the case
inside most AI agents' shells.

**YouTube captions: the video's own English track first.** `youtube subtitle` now asks for
`en,en-orig,zh-Hans,zh` (Agent Reach: `zh-Hans,zh,en,en-orig`). Asking an English video for a Chinese machine
translation first got HTTP 429 from YouTube on 2026-11-02 and paused the YouTube channel for an hour.

**Removed:** the upstream release workflow (`.github/workflows/release.yml`; it requires Agent Reach's own
release-acceptance data for their exact source), the Chinese/English upstream READMEs (sponsors, community links),
replaced by our `README.md`. **Rewritten:** `docs/install.md`. **Added:** `install.command` (the staff installer),
this file.

**Unchanged:** every channel, tool and safety rule. It is read-only; it never logs in for the user and never asks
for a password; keys are entered by the user in their own terminal.

Tests: Agent Reach's own 523 tests pass on this version.
