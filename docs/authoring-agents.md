# Authoring agents

Agents in this repo use the [**Open Agent Format (OAF)**](https://openagentformat.com)
— an open, CC0 specification for portable, technology-agnostic agents. An agent
is a folder containing an `AGENTS.md` (YAML frontmatter + Markdown body) that can
compose [Agent Skills](https://agentskills.io), MCP servers, and other agents.

> ℹ️ **Open standard, but adoption is emerging.** OAF (v0.8, Jan 2026) targets
> Claude Code, Goose, Letta, and others, but "most platforms haven't fully
> integrated OAF yet" — far behind SKILL.md's 30+ tools. So:
>
> **Prefer a skill.** If a capability can be a portable skill, make it one — it
> runs in every harness today. Reach for an agent only when the task needs an
> orchestrating persona with its own context. An OAF agent can *call* our
> portable skills, getting the best of both.

## Don't confuse it with `AGENTS.md` (the guidance file)

There are two different things using the name "AGENTS.md":

1. **AGENTS.md the guidance standard** (agents.md, Linux Foundation) — a
   *project-level* Markdown file at a repo/dir root telling coding agents how to
   work in that project (build commands, conventions). It has **no concept of a
   reusable agent persona**. We don't use it to define agents.
2. **OAF's `AGENTS.md`** — lives *inside an agent's own folder* and defines that
   agent. This is what we use, nested under `agents/<category>/<agent>/` so it's
   never mistaken for project guidance at a root.

## Anatomy

```
agents/<category>/<agent-name>/
└── AGENTS.md        # folder name MUST match the agentKey
```

### Frontmatter (OAF)

```yaml
---
name: Finance Reviewer        # human-readable
vendorKey: alanho             # publisher
agentKey: finance-reviewer    # machine id; matches the folder name
slug: alanho/finance-reviewer # vendorKey/agentKey
version: 0.1.0                # semver
description: <when to delegate to this agent>
author: "@alanho"
license: MIT
tags: [personal-finance]
---
```

The body is the agent's instructions, written in the second person ("You are…").
Be explicit about mission, when to delegate, the skills it uses, method,
guardrails, and output shape.

## Composing skills

Agents get their power by orchestrating portable skills. List the skills the
agent uses **by name** in the body (AgentSkills.io-compatible). OAF v0.8 is still
finalizing the exact frontmatter syntax for skill/MCP references, so naming them
in the body keeps them discoverable until that lands.

## Guidelines

- **Harness-neutral.** Don't hardcode one harness's tool names; describe
  capabilities generically.
- **The final message is the result.** Agents return their last message to the
  orchestrator — make it structured and complete, not chit-chat.
- **Never fabricate.** For finance/health agents, compute from real inputs (via
  skills) or say what's missing. No invented numbers.
- **Stay local** with personal data, same as skills.

## Install & test it

OAF agent installation is harness-specific and still maturing. Where a harness
supports OAF, point it at the agent folder (or its parent). For harnesses without
OAF support, an adapter can generate that harness's native subagent file from the
`AGENTS.md` — a good `adapters/` contribution. Then ask the orchestrator to do
the kind of task the `description` covers and confirm it delegates and reports
back well.
