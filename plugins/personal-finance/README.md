# personal-finance

Your money, organized — without handing it to anyone. A bundle of Claude Code
skills and agents that run **locally** on transaction files and numbers **you**
provide. Nothing is uploaded.

## Install

```
/plugin marketplace add alanho/my-agents-and-skills
/plugin install personal-finance@my-agents-and-skills
```

## Planned capabilities

> 🚧 Skills and agents are being built — this is the scaffold.

| Type | Name | Does |
| --- | --- | --- |
| skill | `spending-analysis` | Parse a bank/CSV export → categories, trends, overspend. |
| skill | `budget-builder` | Turn income + goals into a workable monthly budget. |
| skill | `debt-payoff` | Compare avalanche vs. snowball; produce a payoff schedule. |
| skill | `savings-goals` | Plan and track progress toward savings targets. |
| skill | `net-worth` | Snapshot assets − liabilities; track over time. |
| agent | `finance-reviewer` | Full monthly review: reconcile spend vs. budget, flag variances. |

## Privacy

Everything runs on your machine against files you point it at. No accounts, no
API keys, no uploads. Keep real exports out of git — the repo `.gitignore`
already blocks common personal-data paths.

## Layout

```
personal-finance/
├── .claude-plugin/plugin.json
├── skills/      # one folder per skill (SKILL.md + optional scripts/)
└── agents/      # one .md file per agent
```
