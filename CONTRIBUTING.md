# Contributing

Thanks for adding to the collection. The bar: each skill should make some part
of life **measurably easier**, run **locally** where personal data is involved,
be **self-contained**, and be **portable** — runnable in any harness that
supports the open [Agent Skills](https://agentskills.io) standard.

## Add a skill (the portable, preferred unit)

1. Pick (or create) a category under `skills/<category>/`.
2. Create the skill folder: `skills/<category>/<skill-name>/`. The folder name
   MUST match the `name` in frontmatter — lowercase `kebab-case`.
3. Copy [`templates/SKILL.template.md`](templates/SKILL.template.md) to
   `SKILL.md` inside it and fill it in.
4. Add any helper `scripts/`, `references/`, or `assets/` next to `SKILL.md`.
5. Read [`docs/authoring-skills.md`](docs/authoring-skills.md) — especially the
   rules that keep a skill **portable** and its `description` **triggering**.

### Portability rules (non-negotiable)

- **Standard frontmatter only.** Use `name`, `description`, and the recommended
  `version`/`authors`/`tags`/`license`. **Omit `platforms`** so the skill
  declares compatibility with all harnesses.
- **Harness-neutral body.** Refer to capabilities generically — "read the file
  the user provides", "run `scripts/x.py`". Never name a specific harness's
  tools or assume its internals.
- **Deterministic where possible.** Push parsing/math into `scripts/`; it's
  cheaper and more reliable than asking the model to compute.

## Add an agent (open standard too — OAF)

Only when a task genuinely can't be a skill. Agents use the open
[Open Agent Format](https://openagentformat.com) — portable, CC0 — but its
harness adoption is still emerging, so prefer a skill when you can. An agent can
compose your portable skills.

1. Create the folder `agents/<category>/<agent-name>/` (folder name = `agentKey`).
2. Copy [`templates/AGENTS.template.md`](templates/AGENTS.template.md) to
   `AGENTS.md` inside it; fill the OAF frontmatter (`name`, `vendorKey`,
   `agentKey`, `slug`, `version`, `description`, `author`, `license`, `tags`) and
   the body, listing the skills it uses by name.
3. See [`docs/authoring-agents.md`](docs/authoring-agents.md) — including the note
   on **not** confusing OAF's `AGENTS.md` with the Linux Foundation's
   project-guidance `AGENTS.md`.

## Conventions

- **Names**: lowercase `kebab-case`; frontmatter `name` matches the folder/file.
- **Descriptions**: write for *triggering*, not for humans. What it does, then
  concrete situations and trigger phrases.
- **No secrets, no personal data.** Never commit real financial exports, API
  keys, or account numbers. Use small synthetic samples in `references/` if you
  need example data.
- **Local first.** Prefer reading user-provided files over external services. If
  a network call is unavoidable, say so explicitly in the skill body.
- Update the catalog tables in [`README.md`](README.md) and the relevant
  category README.

## Test before you commit

1. `./install.sh --harness claude <your-skill>` (or `--dir <path>` for another
   harness).
2. Prompt naturally — don't name the skill — and confirm it loads on its own and
   behaves.
3. If you have access to a second harness, install there too and confirm the
   same `SKILL.md` works unchanged. That's the whole point.
