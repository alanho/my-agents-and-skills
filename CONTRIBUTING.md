# Contributing

Thanks for adding to the collection. The bar: each skill or agent should make
some part of life **measurably easier**, run **locally** where personal data is
involved, and be **self-contained** enough to copy and use on its own.

## Add a skill

1. Pick (or create) a plugin under `plugins/<theme>/`.
2. Create a folder: `plugins/<theme>/skills/<skill-name>/`.
3. Copy [`templates/SKILL.template.md`](templates/SKILL.template.md) to
   `SKILL.md` inside it and fill it in.
4. Add any helper `scripts/` or `references/` next to `SKILL.md`.
5. Read [`docs/authoring-skills.md`](docs/authoring-skills.md) for what makes a
   `description` trigger reliably — it is the single most important field.

## Add an agent

1. Create `plugins/<theme>/agents/<agent-name>.md`.
2. Copy [`templates/agent.template.md`](templates/agent.template.md) and fill the
   frontmatter (`name`, `description`, `tools`, `model`) plus the system prompt.
3. See [`docs/authoring-agents.md`](docs/authoring-agents.md).

## Register the plugin

If you created a **new** plugin, add it to the `plugins` array in
[`.claude-plugin/marketplace.json`](.claude-plugin/marketplace.json) and create
`plugins/<theme>/.claude-plugin/plugin.json`. Add a row to the catalog table in
[`README.md`](README.md).

## Conventions

- **Names**: lowercase `kebab-case` for skill folders, agent files, and plugin
  names. Match the `name:` in frontmatter to the folder/file name.
- **Descriptions**: write for *triggering*, not for humans. Start with what the
  skill does, then list concrete situations and trigger phrases.
- **No secrets, no personal data.** Never commit real financial exports, API
  keys, or account numbers. Use small synthetic samples in `references/` if you
  need example data.
- **Local first.** Prefer reading files the user provides over calling external
  services. If a network call is needed, say so explicitly in the skill body.

## Test before you commit

- Install the plugin locally: `/plugin marketplace add <path-to-this-repo>`
  then `/plugin install <plugin>@my-agents-and-skills`.
- Trigger the skill with a realistic prompt and confirm it loads and behaves.
- For agents, spawn one and confirm the tool set and output are right.
