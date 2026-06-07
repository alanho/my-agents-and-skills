# Harness support

Skills in this repo follow the open [**Agent Skills Specification**](https://agentskills.io)
— a `SKILL.md` file (YAML frontmatter + Markdown body) in a folder, optionally
with `scripts/`, `references/`, and `assets/`. The same folder is read, unchanged,
by every harness that supports the standard. As of 2026 that includes Claude
Code, OpenClaw, Codex CLI, Gemini CLI, GitHub Copilot, Cursor, JetBrains Junie,
Block's Goose, and ~30 others.

There is **nothing harness-specific in a skill**. Portability comes from two
rules we follow when authoring (see [`authoring-skills.md`](authoring-skills.md)):

1. Frontmatter uses only standard fields; we **omit `platforms`** so a skill
   declares itself compatible with all.
2. The body refers to capabilities generically ("read the file the user
   provides", "run `scripts/parse.py`") — never to one harness's tool names.

## Installing

Every harness discovers skills from a directory. Installing = putting the skill
folder there. Use the bundled installer:

```bash
./install.sh --harness <name>        # symlink all skills (edits propagate)
./install.sh --harness <name> --copy # copy a snapshot instead
./install.sh --dir <path>            # install into an explicit directory
./install.sh --list                  # list skills in this repo
```

### Known skill directories

| Harness | Global skills dir | Notes |
| --- | --- | --- |
| Claude Code | `~/.claude/skills/` (or `.claude/skills/` per-project) | Confirmed by the spec. |
| Codex CLI | `~/.codex/skills/` | Common default — verify for your version. |
| Gemini CLI | `~/.gemini/skills/` | Common default — verify for your version. |
| Goose | `~/.config/goose/skills/` | Common default — verify for your version. |
| OpenClaw | `~/.openclaw/skills/` | Common default — verify for your version. |
| Others | varies | Pass the path with `--dir`. |

Project-level dirs take precedence over global ones where a harness supports
both. If your harness uses a different path, the skills still work — just point
`--dir` at the right place (or copy the folder there manually).

## Agents: a second open standard (OAF)

The Agent Skills standard covers **skills**, not **agents**. For agents we use a
different open standard: the [**Open Agent Format (OAF)**](https://openagentformat.com)
— CC0, an agent is a folder with an `AGENTS.md` (frontmatter + body) that can
compose skills, MCP servers, and other agents.

Two important caveats:

- **Adoption is emerging.** OAF (v0.8, Jan 2026) targets Claude Code, Goose,
  Letta and others, but most harnesses haven't fully integrated it yet — far
  behind SKILL.md. So **skills are still the portable core**; prefer a skill, and
  use an OAF agent (which can call those skills) only when you need a persona.
- **Name collision.** OAF's per-agent file is called `AGENTS.md`, which is also
  the name of a *different* open standard — the Linux Foundation's project-level
  guidance file (build commands, conventions; no persona concept). We avoid
  confusion by nesting OAF agents under `agents/<category>/<agent>/AGENTS.md`, so
  they're never at a repo/dir root where the guidance file is expected.

Where a harness lacks OAF support, an `adapters/` contribution can generate that
harness's native subagent file from the `AGENTS.md`.

## Why no Claude Code plugin / marketplace?

An earlier draft packaged everything as a Claude Code plugin marketplace. That
is CC-specific and works against the "any harness" goal, so it was dropped in
favor of portable skills + the universal installer (which covers Claude Code via
`~/.claude/skills` just like every other harness). A thin CC-plugin wrapper
could be added later under an `adapters/` folder without touching the skills.
