# Install Kang Eyes Agent (full install)

For the AI doing the work (Hermes, Claude Code, Codex, Cursor, OpenClaw…). Run every command yourself, in order. Each
`kang-eyes` command prints one JSON object; read `ok`, `result` and `error.hint`. Kang Eyes Agent is our version of
Agent Reach 1.6.1 (MIT); what changed is in `KANG-EYES-CHANGES.md`.

## 0. Before you start

- You must be able to run terminal commands. If you can't, tell the user: "Please turn on command execution for me in
  my settings, then ask again."
- Already installed? If `kang-eyes version` prints JSON, go to [Update](#update).
- `uv` missing (`uv --version` fails)? Tell the user: "I'm installing uv, a small tool that installs command-line
  programs. It needs no admin password." Then run:
  ```bash
  curl -LsSf https://astral.sh/uv/install.sh | sh
  ```
- In every command below, make sure `~/.local/bin` is on the PATH: `export PATH="$HOME/.local/bin:$PATH"`.

## 1. Install and set up

```bash
uv tool install --force https://github.com/kang-blanc-tech/kang-eyes-agent/releases/latest/download/kang-eyes.zip
uv tool update-shell
AGENT_REACH_LANG=en kang-eyes setup
```

`setup` turns on the everyday channels (GitHub, YouTube, web, V2EX, Bilibili) and gives every AI on this computer the
`kang-eyes` skill. Keep `result.installation_report.markdown` for step 3.

## 2. Add every other platform (the full install)

Tell the user: "I'm adding every platform. Reddit, X, LinkedIn, Xiaohongshu, Xueqiu, Boss, Facebook and Instagram will
reuse YOUR OWN Chrome login the first time you use each one; nothing is copied now, and I never log in for you."

```bash
for c in reddit twitter linkedin xiaohongshu xueqiu boss facebook instagram xiaoyuzhou; do
  AGENT_REACH_LANG=en kang-eyes add "$c"
done
```

Each line prints JSON. If one fails, read its `error.hint`, tell the user which platform and why, and carry on with the
rest. The login sites need Node.js and a browser tool; `add` installs what it needs (expect a few hundred MB).

## 3. Report to the user

Show `result.installation_report.markdown` from step 1 as is, then run and show:

```bash
AGENT_REACH_LANG=en kang-eyes doctor --text
```

Then tell the user, in plain words:
- Everything is installed; they can just ask, e.g. "read this link" or "search Reddit for …".
- Xiaoyuzhou podcasts and YouTube speech-to-text need a free Groq key (console.groq.com) that THEY type into their own
  Terminal: `kang-eyes configure groq-key`. Never ask for a key in the chat.

## Update

```bash
AGENT_REACH_LANG=en kang-eyes update
```

Tell the user each line of `result.user_actions`, and show `result.installation_report.markdown` as is when present.

## Rules

- Read-only: never post, comment, like or send messages.
- Never log in for the user and never ask for a password, cookie or key. A login window opens only when the user really
  has to sign in again, and they do it themselves (`kang-eyes login <site>`).
- Everything else (usage, logins, the browser) is in the installed `kang-eyes` skill.
