# 👁️ Kang Eyes Agent

**Let your AI agent read the parts of the internet it cannot reach on its own:** posts behind a login, what is said
in a video, Chinese platforms, and clean structured data. One command.

Kang Eyes Agent is our own version of [Agent Reach](https://github.com/Panniantong/Agent-Reach) 1.6.1 (MIT
License, © 2025 Agent Eyes). What we changed is listed in [KANG-EYES-CHANGES.md](KANG-EYES-CHANGES.md).

## Install (staff)

1. Get the **Kang Eyes Agent** folder from Kang (it holds `kang-eyes.zip` and `install.command`).
2. Double-click **`install.command`** (first time: right-click › Open). It installs the `kang-eyes` command and
   gives every AI app on your Mac the `kang-eyes` skill (Claude Code, Codex, Cursor, Gemini, Copilot, OpenCode,
   Hermes, whichever you have).
3. Ask your AI: *"How is Kang Eyes doing?"*

If `uv` (a small installer for command-line programs, no admin password) is missing, the installer asks before
adding it.

## What it can read

| Channel | Without a login | Login needed for |
|---|---|---|
| GitHub | search repos, read READMEs, issues, PRs | — |
| YouTube | video info, search, subtitles (captions) | — (speech-to-text needs a Groq key) |
| Web | search, read pages | — |
| V2EX | hot topics, nodes, threads, users | — |
| Bilibili | search, video info, trending | subtitles |
| Reddit | search, read posts and comments | — |
| X / Twitter | search summaries | search tweets, profiles, threads |
| LinkedIn | public jobs | site search |
| Xiaohongshu | search summaries | site search, notes, comments |
| Xueqiu | quotes, stock search | hot posts, hot stocks |
| Boss | titles and links | site search, details |
| Facebook / Instagram | summaries | site search, profiles, posts |
| Xiaoyuzhou | — | podcast transcription needs a Groq key |

```bash
kang-eyes channels                  # every channel and what it can do
kang-eyes read <url>                # picks the channel from the link
kang-eyes <channel> <action> [args] # e.g. kang-eyes youtube subtitle <url>
kang-eyes doctor --text             # status, no network
kang-eyes check <channel> --text    # live test of one channel
```

## Safety

- **Read-only:** it searches and reads; it never posts, comments, likes or sends messages.
- **It never logs in for you and never asks for your password.** A login site reuses the login already in YOUR
  Chrome the first time it is used (that one site only; your browser is not changed). That is usually your main
  account; to use a second account, tell your AI "switch account".
- **Keys go in your own Terminal, never in a chat:** `kang-eyes configure groq-key`.
- Its dedicated background browser accepts connections from this Mac only.

## Managing it

Tell your AI in plain words: "add Xiaohongshu", "remove V2EX", "my Reddit login expired", "update Kang Eyes",
"uninstall Kang Eyes" (it lists what it would remove first). Everything it installs lives in `~/.kang-eyes/`.

## Licence

MIT. The original Agent Reach copyright and licence text are kept in [LICENSE](LICENSE), with our line added for
our changes.
