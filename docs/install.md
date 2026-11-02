# Install or update Kang Eyes Agent

For the AI doing the work. Run every command yourself. Each `kang-eyes` command prints one JSON object; read `ok`,
`result` and `error.hint`. Kang Eyes Agent is our version of Agent Reach 1.6.1 (see `KANG-EYES-CHANGES.md`).

## 0. Before you start

- You must be able to run terminal commands. If you can't, tell the user: "Please turn on command execution for me in
  my settings, then ask again."
- Already installed? `kang-eyes version` prints JSON → go to [Update](#update).
- `uv` missing (`uv --version` fails)? Tell the user: "I'm installing uv, a small tool that installs command-line
  programs. It needs no admin password." Then: `curl -LsSf https://astral.sh/uv/install.sh | sh`

## 1. Install and set up

The installer is the `kang-eyes.zip` file Kang hands out (the staff folder also has `install.command`, which does all
of this by double-click). With the path to that zip:

```bash
uv tool install --force /path/to/kang-eyes.zip
AGENT_REACH_LANG=en kang-eyes setup
```

With access to the private repository instead:
`gh release download --repo kang-blanc-tech/kang-eyes-agent --pattern kang-eyes.zip`, then the same two lines.

`kang-eyes` not found after install? Run `uv tool update-shell` and open a new shell.

`setup` turns on the default channels and gives every AI on this computer the `kang-eyes` skill.

## 2. Report to the user

Show `result.installation_report.markdown` to the user as is.

## Update

```bash
AGENT_REACH_LANG=en kang-eyes update
```

Updates come only from `kang-blanc-tech/kang-eyes-agent`. That repository is private: on a Mac without access the
update fails, and the new version comes as a new `kang-eyes.zip` from Kang (install it with step 1).

## Later

- "add Xiaohongshu" → `kang-eyes add <channel>`; "remove V2EX" → `kang-eyes remove <channel>`.
- Keys are entered by the user in their own terminal, e.g. `kang-eyes configure groq-key`.
- Everything else (usage, login, browser) is in the installed skill.
