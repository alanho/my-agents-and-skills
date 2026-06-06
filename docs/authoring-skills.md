# Authoring skills

A **skill** is a folder containing a `SKILL.md` file. Claude Code reads the
frontmatter of every available skill and loads the full body **only when the
`description` matches what the user is doing**. So the description is the most
important thing you write.

## Anatomy

```
skills/<skill-name>/
├── SKILL.md          # required — frontmatter + instructions
├── scripts/          # optional — helper scripts the skill calls
└── references/       # optional — docs/data loaded on demand
```

### Frontmatter

```yaml
---
name: skill-name              # must match the folder name, kebab-case
description: <triggering text> # see below — this decides when it loads
---
```

`trigger: /command` is optional — add it when the skill should also fire from an
explicit slash command.

## Writing a description that triggers reliably

The description is matched against the user's intent. Make it specific.

- **Lead with the capability**: what the skill does, in one clause.
- **List the situations**: the concrete moments it applies.
- **Include trigger phrases**: the actual words a user would type.
- **Disambiguate**: if a sibling skill is similar, say what this one is *not* for.

❌ Too vague: `description: Helps with money.`

✅ Triggers well:
`description: Analyze monthly spending from a CSV/bank export — categories,`
`trends, and overspend vs. budget. Use when the user shares a transactions`
`file, asks "where did my money go", mentions budgeting, or invokes /spending.`

## Keep the body tight

- The body is loaded into the main context, so don't bloat it. Put long
  reference material in `references/` and tell the model to read it when needed.
- Prefer deterministic helper `scripts/` for anything mechanical (parsing,
  math) — they are cheaper and more reliable than asking the model to compute.
- State **inputs**, **steps**, and **output** explicitly.

## Privacy

For life/finance skills, default to **local-only**: read files the user points
at, write results next to them, and never upload personal data. Say this in the
body so the behavior is explicit.

## Test it

1. `/plugin marketplace add <path-to-this-repo>`
2. `/plugin install <plugin>@my-agents-and-skills`
3. Prompt naturally (don't name the skill) and confirm it loads on its own.
