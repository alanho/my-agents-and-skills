# my-agents-and-skills

> Life-improving [Claude Code](https://claude.com/claude-code) agents and skills — practical, shareable, and private by default.

This repo is a **Claude Code plugin marketplace**. Each plugin bundles related
**skills** (capabilities Claude loads on demand) and **agents** (specialized
sub-assistants) around one area of life. The goal: tools that make day-to-day
life measurably better — not toy demos.

## Catalog

| Plugin | What it does | Status |
| --- | --- | --- |
| [`personal-finance`](plugins/personal-finance) | Budgeting, spending analysis, debt payoff, savings goals, net-worth tracking — fully local, your data never leaves your machine. | 🚧 in progress |

More life themes planned: health & habits, learning, home & admin.

## Install

You need [Claude Code](https://claude.com/claude-code) installed.

**1. Add this marketplace**

```
/plugin marketplace add alanho/my-agents-and-skills
```

**2. Install a plugin**

```
/plugin install personal-finance@my-agents-and-skills
```

Then just talk to Claude — installed skills trigger automatically when relevant,
and agents become available to the orchestrator.

### Prefer to copy a single skill?

Every skill is a self-contained folder under `plugins/<name>/skills/<skill>/`.
Copy it into `~/.claude/skills/` (user-level) or `<project>/.claude/skills/`
(project-level) and it works without the plugin wrapper.

## Repository layout

```
my-agents-and-skills/
├── .claude-plugin/marketplace.json   # marketplace manifest (lists every plugin)
├── plugins/<name>/                   # one installable plugin per life theme
│   ├── .claude-plugin/plugin.json    # plugin manifest
│   ├── skills/<skill>/SKILL.md       # a skill = a folder with SKILL.md
│   └── agents/<agent>.md             # an agent = one markdown file
├── templates/                        # copy-to-start scaffolds
└── docs/                             # how to author skills & agents
```

## Skills vs. agents — which do I write?

- **Skill** — a reusable *capability* with instructions, and optionally scripts
  and reference files. Loaded into the main conversation when its `description`
  matches what the user is doing. Best for "how to do X well."
- **Agent** — a *sub-assistant* with its own system prompt, tool set, and
  context window. Spawned for focused, multi-step work that benefits from
  isolation. Best for "go do X and report back."

Full guidance: [`docs/authoring-skills.md`](docs/authoring-skills.md) ·
[`docs/authoring-agents.md`](docs/authoring-agents.md).

## Privacy

Finance and other life data is personal. Skills here are built to run
**locally** and read data **you point them at** — nothing is uploaded. The
[`.gitignore`](.gitignore) blocks common secret and personal-data paths so you
never commit them by accident.

## Contributing

New skills and agents welcome — see [`CONTRIBUTING.md`](CONTRIBUTING.md).

## License

[MIT](LICENSE) © Alan Ho
