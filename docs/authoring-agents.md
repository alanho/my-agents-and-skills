# Authoring agents

An **agent** (subagent) is a single markdown file with frontmatter and a system
prompt. The orchestrator spawns it for focused, multi-step work in its own
context window, with its own tool set. Use an agent when a task benefits from
isolation — broad search, a long reconciliation, an adversarial review.

## Anatomy

```
agents/<agent-name>.md
```

### Frontmatter

```yaml
---
name: agent-name              # kebab-case, matches the file name
description: <when to invoke> # the orchestrator reads this to decide
model: inherit                # inherit | a specific model id
tools: ["Read", "Write", "Bash", "Grep"]   # least privilege — only what it needs
color: blue                   # optional, cosmetic
---
```

The rest of the file is the **system prompt** — write it in the second person
("You are…"). Be explicit about mission, method, guardrails, and output shape.

## Skill or agent?

| Use a **skill** when… | Use an **agent** when… |
| --- | --- |
| You're adding a capability to the main conversation | You want work done in a separate context and returned |
| The work is short and inline | The work is multi-step or long-running |
| You want it to trigger automatically by description | You want the orchestrator to delegate explicitly |

They compose: an agent's system prompt can tell it to use a skill.

## Guidelines

- **Least-privilege tools.** Grant only the tools the agent needs. A read-only
  analyst shouldn't have `Write` or `Bash`.
- **The final message is the result.** Agents don't chat with the user — their
  last message is returned to the orchestrator. Make it structured and complete.
- **Never fabricate.** For finance/health agents, compute from real inputs or
  say what's missing. No invented numbers.
- **Stay local** with personal data, same as skills.

## Test it

Install the plugin, then ask the orchestrator to do the kind of task the
agent's `description` covers and confirm it gets delegated and reports back well.
