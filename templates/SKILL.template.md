---
# Agent Skills open standard — https://agentskills.io
# Required:
name: skill-name                    # < 50 chars; MUST match the skill folder name
description: One specific sentence — what it does + WHEN to use it (loaded at startup, ~100 token budget). Lead with the capability, then concrete situations and trigger phrases.
# Recommended:
version: 0.1.0                      # semver
authors: [alanho]                   # GitHub usernames / orgs
tags: [personal-finance]            # for discovery
license: MIT
# Optional:
# platforms: []                     # omit entirely = works on ALL harnesses (the default we want)
# repository: https://github.com/alanho/my-agents-and-skills
---

# skill-name

One-paragraph overview: what this produces and the value it delivers.

> Written harness-neutral on purpose. Refer to capabilities generically — "read
> the file the user provides", "run `scripts/x.py`" — not to any one harness's
> tool names. This SKILL.md is read unchanged by Claude Code, OpenClaw, Codex
> CLI, Gemini CLI, Goose, and others.

## When to use

- Concrete situation 1
- Concrete situation 2
- Trigger phrases: "...", "...", "..."

## Inputs

What the skill needs from the user (a file path, a number, a goal) and the
expected format. Ask for anything missing before proceeding.

## Steps

1. First do this.
2. Then this — prefer a deterministic `scripts/` helper for parsing/math.
3. Produce the output below.

## Output

What the user gets back and in what shape (table, summary, a written file next
to their input).

## Notes

- Privacy / local-only constraints.
- Edge cases and how to handle them.
- On-demand files: `scripts/`, `references/`, `assets/` load only when needed.
