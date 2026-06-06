# my-agents-and-skills

> Life-improving **Agent Skills** that work in any harness — Claude Code,
> OpenClaw, Codex CLI, Gemini CLI, Goose, and more. Practical, shareable, and
> private by default.

These are portable skills built on the open
[**Agent Skills Specification**](https://agentskills.io): a `SKILL.md` file in a
folder, read **unchanged** by 30+ AI coding tools. No lock-in to any one harness.
The goal is tools that make day-to-day life measurably better — starting with
personal finance.

## Catalog

| Category | Skills | Status |
| --- | --- | --- |
| [`personal-finance`](skills/personal-finance) | spending analysis, budgeting, debt payoff, savings goals, net worth — fully local, your data never leaves your machine | 🚧 in progress |

More life themes planned: health & habits, learning, home & admin.

## Install (any harness)

Skills are plain folders a harness reads from its skills directory. The bundled
installer links or copies them there:

```bash
git clone https://github.com/alanho/my-agents-and-skills
cd my-agents-and-skills

./install.sh --list                 # see what's available
./install.sh --harness claude       # install all into Claude Code (~/.claude/skills)
./install.sh --harness codex        # …or Codex CLI, gemini, goose, openclaw
./install.sh --dir ~/path/to/skills # …or any explicit skills directory
./install.sh --harness claude spending-analysis   # …or just specific skills
```

Symlink by default (repo edits propagate live); add `--copy` for a snapshot.
Per-harness paths and details: [`docs/harness-support.md`](docs/harness-support.md).

After installing, just talk to your agent — a skill loads automatically when its
`description` matches what you're doing.

## Why portable?

- **No lock-in.** The same `SKILL.md` runs in every harness that supports the
  open standard. Switch tools, keep your skills.
- **Spec-compliant frontmatter.** Standard fields only; `platforms` omitted so
  each skill works everywhere.
- **Harness-neutral bodies.** Instructions reference capabilities generically,
  never one tool's API.

## Repository layout

```
my-agents-and-skills/
├── skills/<category>/<skill>/        # portable, spec-compliant skills (the core)
│   └── SKILL.md  (+ scripts/ references/ assets/)
├── agents/<category>/<agent>.md      # optional subagents — Claude Code format, NOT portable
├── install.sh                        # link/copy skills into any harness
├── templates/                        # copy-to-start scaffolds
└── docs/                             # authoring + per-harness install guides
```

`<category>` is repo-side grouping only; the installer flattens each skill folder
directly into the harness skills dir, as the spec expects.

## Skills vs. agents

- **Skill** — a portable *capability* (instructions + optional scripts/refs).
  Works in every supported harness. **Prefer this.**
- **Agent** — a harness-specific *subagent* for focused multi-step work in its
  own context. Not covered by the open standard yet; the ones here are Claude
  Code format. Use only when a skill can't express the task.

Guides: [`docs/authoring-skills.md`](docs/authoring-skills.md) ·
[`docs/authoring-agents.md`](docs/authoring-agents.md) ·
[`docs/harness-support.md`](docs/harness-support.md).

## Privacy

Life data is personal. Skills here run **locally** against files **you** point
them at — nothing is uploaded. [`.gitignore`](.gitignore) blocks common secret
and personal-data paths so you never commit them by accident.

## Contributing

New skills welcome — see [`CONTRIBUTING.md`](CONTRIBUTING.md).

## License

[MIT](LICENSE) © Alan Ho
