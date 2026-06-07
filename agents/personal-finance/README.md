# personal-finance agents

Portable agents for deeper, multi-step finance work (e.g. a full monthly review
that reconciles spending against a budget and reports variances). Each agent is
a folder containing an `AGENTS.md` in the
[**Open Agent Format (OAF)**](https://openagentformat.com) — an open, CC0 spec
for technology-agnostic agents that can compose [Agent Skills](https://agentskills.io)
and MCP servers.

> ℹ️ **Open standard, emerging support.** OAF is read by harnesses that support
> it (Claude Code, Goose, Letta, …), but adoption is far behind SKILL.md's 30+
> tools. **Prefer a skill** when a capability can be one — skills run everywhere
> today. Use an agent when the task genuinely needs an orchestrating persona.
> See [`../../docs/harness-support.md`](../../docs/harness-support.md).

## Layout

```
agents/personal-finance/<agent-name>/AGENTS.md   # OAF; folder name = agentKey
```

## Planned agents

| Agent | Does |
| --- | --- |
| `finance-reviewer` | Full monthly review: reconcile spend vs. budget, flag variances, summarize. Composes the `spending-analysis` + `budget-builder` skills. |
