# Troubleshooting

Start with:

```bash
kang-eyes doctor --text     # offline status of every channel
kang-eyes check <channel> --text   # live test of one channel
```

## Error codes

Every failed command returns `ok: false` and an `error` with `code`, `message` and `hint`. The `hint` is usually the exact next step.

| Code | Meaning | What to do |
|---|---|---|
| `NEED_SETUP` | a tool, key or selected browser connection is missing | run `kang-eyes doctor --text` and follow the problem listed for the channel; use `kang-eyes add <channel>` to install the channel's tools |
| `NEED_LOGIN` | login is missing or expired | the user runs `kang-eyes login <channel>` and logs in themselves; do not delete credentials to fix a connection or platform-verification error |
| `UPSTREAM_BROKEN` | the upstream tool or platform failed | don't retry in a loop; try again later, inspect the upstream error and pinned dependency version, then `kang-eyes check <channel>`; still broken → open an issue with the `message` |
| `TIMEOUT` | no backend answered in time | retry later, or pass a larger `--timeout SECONDS`; on a restricted network set a proxy (below) |
| `RATE_LIMITED` | the platform is throttling | wait for `retry_after_seconds`; do not switch accounts or backends to continue requesting |
| `NOT_FOUND` | the content does not exist | check the link, id or username |
| `BAD_INPUT` | wrong arguments or unknown channel/action | run `kang-eyes channels` for valid actions and usage |

## Doctor statuses

| Status | Meaning | What to do |
|---|---|---|
| `not_added` | optional channel not turned on | `kang-eyes add <channel>` |
| `needs_setup` | something is missing; `problems` says what | use `kang-eyes add <channel>` or follow the specific setup step |
| `needs_login` | the last live check failed only on login | `kang-eyes login <channel>` (the user logs in) |
| `unverified` | set up, but no live check in the last 24 hours | `kang-eyes check <channel>` |
| `search_ready` | search returned nonempty results in the last 24 hours | read and other actions need their own checks |
| `ready` | passed the recorded live checks in the last 24 hours | inspect verified actions for the requested capability |
| `cooldown` | a rate limit is still active | wait for `retry_after_seconds` |
| `broken` | the last live check failed for another reason | `kang-eyes update`, then `kang-eyes check <channel> --text`; see `UPSTREAM_BROKEN` |

Run `kang-eyes check` first if you want fresh live results. In the `doctor` output, `regressed: true` on a channel means an action passed in the previous check and fails in the latest one.

## Tool versions

Some channel tools install at tested versions; others use a supported range. `kang-eyes doctor` shows installed versions. If a version fails, inspect the exact backend attempt before changing it.

## Reusing existing sessions

`login CHANNEL` opens the Reach dedicated window. The user logs in there. Personal Chrome sessions are never imported. `browser setup` prepares the dedicated extension and connection; an incompatible existing Bridge is left untouched and reported.

Boss requires an existing CDP BOSS page. Select it with `browser bind boss http://127.0.0.1:PORT`. Only explicit `login boss --new-browser` may open its persistent dedicated profile. After the user confirms login and stability, run `login boss --sync`. Do not clear risk locks or switch profiles to retry a platform block.

LinkedIn/Bilibili preserve existing native sessions. `login CHANNEL --native` explicitly runs their own authentication if necessary. Saved state is not proof of authentication: use `check CHANNEL --search`.

Search-only acceptance is shown as search_ready, not proof that every action works. PLATFORM_BLOCKED means stop and have the user check the official page. BUSY means another Reach command owns the same browser; schedule later.

## Skill not picked up by an AI

`kang-eyes skill` shows the one real copy of the instructions (`~/.agents/skills/kang-eyes/SKILL.md`) and the links made for other AIs. An AI not covered automatically: `kang-eyes skill link <its skills folder>`. On Windows, where links may not be allowed, a copy is made instead and refreshed by `kang-eyes update`.

## Install, update and roll back

Kang Eyes Agent is installed with uv. A copy installed another way (pip or pipx, as 1.5 was) moves itself to uv on the next `kang-eyes update`; your channels, keys and logins under `~/.kang-eyes/` are kept.

A new version broke something? Go back to the previous release, then line the tools and skill up with it:

```bash
uv tool install --force https://github.com/kang-blanc-tech/kang-eyes-agent/archive/refs/tags/v<previous>.zip
kang-eyes update --sync-only
```

Removed default channels stay removed across updates; `kang-eyes add <channel>` brings one back.

## Proxy

Some platforms block certain networks or regions. Save a proxy once (the address is asked for with hidden input, since it may contain a password):

```bash
kang-eyes configure proxy
```

An agent without a terminal prompt can pipe the value in: `kang-eyes configure proxy --stdin`.

It is used for every Kang Eyes Agent command. An `HTTPS_PROXY` set in your shell takes precedence.

## Browser port

The Kang Eyes Agent browser listens on CDP port 9222 by default. If another tool already uses 9222 (another automation browser, a debugging Chrome), browser channels fail with `Port 9222 belongs to an unmanaged browser`. Move Kang Eyes Agent to a free port instead of closing that tool:

```bash
kang-eyes configure browser-port 9333
```

The setting is kept across updates. If the Kang Eyes Agent browser is open, it closes and reopens on the new port the next time it is used.

## Still stuck

- `kang-eyes update` and try again.
- Remove and re-add a channel: `kang-eyes remove <channel>` then `kang-eyes add <channel>` (remove also clears its login, its site cookies in the Kang Eyes Agent browser, and its private tools nobody else uses).
- Open an issue at https://github.com/kang-blanc-tech/kang-eyes-agent/issues with the output of `kang-eyes doctor --text` (it starts with the version) and `kang-eyes check <channel> --text`. Remove any personal data first.
