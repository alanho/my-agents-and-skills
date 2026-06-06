# personal-finance agents

Optional subagents for deeper, multi-step finance work (e.g. a full monthly
review that reconciles spending against a budget and reports variances).

> ⚠️ **Harness-specific.** Unlike the skills in this repo, subagent definitions
> are **not** covered by the open Agent Skills standard yet. The files here use
> the Claude Code subagent format (frontmatter: `name`, `description`, `model`,
> `tools` + a system prompt). They will not load as-is in harnesses that lack a
> subagent concept. See [`../../docs/harness-support.md`](../../docs/harness-support.md).
>
> Prefer a skill when the capability can be expressed as one — skills are
> portable across every harness; agents are not.

## Planned agents

| Agent | Does |
| --- | --- |
| `finance-reviewer` | Full monthly review: reconcile spend vs. budget, flag variances, summarize. |
