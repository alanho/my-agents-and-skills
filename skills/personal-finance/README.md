# personal-finance skills

Portable [Agent Skills](https://agentskills.io) for managing money — run by any
harness that reads `SKILL.md`, on data **you** provide, **locally**. Nothing is
uploaded.

Each subfolder here is one self-contained, spec-compliant skill. Install them
into your harness with the repo's [`install.sh`](../../install.sh), e.g.
`./install.sh --harness claude`.

## Planned skills

> 🚧 Scaffold — skills are being built next.

| Skill | Does |
| --- | --- |
| `spending-analysis` | Parse a bank/CSV export → categories, trends, overspend. |
| `budget-builder` | Turn income + goals into a workable monthly budget. |
| `debt-payoff` | Compare avalanche vs. snowball; produce a payoff schedule. |
| `savings-goals` | Plan and track progress toward savings targets. |
| `net-worth` | Snapshot assets − liabilities; track over time. |

## Privacy

These skills read files you point them at and write results next to them. No
accounts, no API keys, no network calls. Keep real financial exports out of git —
the repo [`.gitignore`](../../.gitignore) blocks common personal-data paths.
