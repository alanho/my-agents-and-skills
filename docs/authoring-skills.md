# Authoring skills

A **skill** is a folder containing a `SKILL.md`, following the open
[Agent Skills Specification](https://agentskills.io). Every supported harness
(Claude Code, OpenClaw, Codex CLI, Gemini CLI, Goose, …) reads the same file.
A harness loads the full body **only when the `description` matches** what the
user is doing — so the description is the most important thing you write.

## Anatomy

```
skills/<category>/<skill-name>/
├── SKILL.md          # required — frontmatter + instructions
├── scripts/          # optional — helper scripts (.sh, .py) the skill calls
├── references/       # optional — docs/data (.md, .txt) loaded on demand
└── assets/           # optional — images/templates (.png, .svg)
```

`scripts/`, `references/`, and `assets/` load **on demand**, not eagerly — put
anything long in there and tell the model to read it when needed.

### Frontmatter

```yaml
---
name: skill-name            # REQUIRED — < 50 chars; MUST match the folder name
description: <triggering>    # REQUIRED — one line, ~100 token budget; see below
version: 0.1.0              # recommended — semver
authors: [alanho]           # recommended — GitHub usernames/orgs
tags: [personal-finance]    # recommended — discovery
license: MIT                # optional — SPDX id
# platforms:                # OPTIONAL — OMIT to mean "all harnesses". Don't set it
#                           #   unless a skill truly only works on specific ones.
---
```

Only `name` and `description` are strictly required, but fill the recommended
fields — they help discovery and provenance.

## Writing a description that triggers reliably

Matched against the user's intent. Make it specific.

- **Lead with the capability** — what it does, in one clause.
- **List the situations** — the concrete moments it applies.
- **Include trigger phrases** — the actual words a user would type.
- **Disambiguate** — if a sibling skill is similar, say what this one is *not* for.

❌ Too vague: `description: Helps with money.`

✅ Triggers well:
`description: Analyze monthly spending from a CSV/bank export — categories,`
`trends, and overspend vs. budget. Use when the user shares a transactions file,`
`asks "where did my money go", mentions budgeting, or wants a spending summary.`

## Keep it portable

This is what makes the skill work everywhere:

1. **Standard frontmatter, no `platforms`.** Don't invent fields; don't pin to a
   harness.
2. **Harness-neutral body.** Say "read the file the user provides" / "run
   `scripts/parse.py`", never "use the Read tool" or any one harness's API. The
   body is just instructions — keep them tool-agnostic.
3. **No assumptions about the runtime** beyond "an agent that can read files and
   run scripts."

## Keep the body tight

- The body loads into context — don't bloat it. Long material goes in
  `references/`.
- Prefer deterministic `scripts/` for parsing and math over asking the model to
  compute.
- State **inputs**, **steps**, and **output** explicitly.

## Privacy

For life/finance skills, default to **local-only**: read files the user points
at, write results next to them, never upload personal data. Say so in the body.

## Test it

```bash
./install.sh --harness claude <skill-name>   # or --dir <path> for another harness
```

Then prompt naturally (don't name the skill) and confirm it loads on its own.
Bonus: install into a second harness and confirm the same file works unchanged.
