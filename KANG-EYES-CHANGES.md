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

**English by default.** The skill, the installation report and its messages are in English unless the environment asks
for Chinese (`AGENT_REACH_LANG=zh`, or a `zh*` system language). Agent Reach defaults to Chinese whenever no English
language is set, which is the case inside most AI agents' shells, and its installation report was Chinese only: ours
adds an English report beside the original (`onboarding.py`, `_installation_report_en`); the Chinese one is unchanged.

**YouTube captions: the video's own English track first.** `youtube subtitle` now asks for
`en,en-orig,zh-Hans,zh` (Agent Reach: `zh-Hans,zh,en,en-orig`). Asking an English video for a Chinese machine
translation first got HTTP 429 from YouTube on 2026-11-02 and paused the YouTube channel for an hour.

**One-line install, like Agent Reach's:** an agent given
`https://raw.githubusercontent.com/kang-blanc-tech/kang-eyes-agent/main/docs/install.md` follows it to a FULL install
(every channel, not only the everyday ones), with no question an agent cannot answer.

**Removed:** the upstream release workflow (`.github/workflows/release.yml`; it requires Agent Reach's own
release-acceptance data for their exact source), the Chinese/English upstream READMEs (sponsors, community links),
replaced by our `README.md`. **Rewritten:** `docs/install.md`. **Added:** `install.command` (the staff installer),
this file.

**Unchanged:** every channel, tool and safety rule. It is read-only; it never logs in for the user and never asks
for a password; keys are entered by the user in their own terminal.

**Tests:** all 529 pass: Agent Reach's own 523 (the three that check the Chinese receipt now set
`AGENT_REACH_LANG=zh`, so they still test it), plus 6 of ours (`tests/test_kang_eyes.py` and
`test_kang_eyes_setup_receipt_is_english_by_default`): English default, Chinese on request, English skill and receipt,
English-first captions, our update source, our name and data folder. Undoing any one of those changes makes its test
fail (checked 2026-11-02).
