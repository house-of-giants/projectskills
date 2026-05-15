# AGENTS.md

Guidelines for AI agents working in this repository.

## Repository overview

This repository contains Project Skills: installable Agent Skills for preserving project context from meetings through decisions, requirements, tickets, PRs, and delivery closeout.

The repo follows the cross-agent skill layout:

```text
skills/<skill-name>/SKILL.md
```

Skills are intended to work with `.agents/skills/` consumers and be portable across Claude Code, Codex, Cursor, Windsurf, Hermes, and other agents that support markdown skills.

## Product principles

- Lead with practical project workflows and strictly formatted markdown, not protocol mechanics.
- `project-context` is the foundation skill. Other skills should read `.agents/projectskills/project-context.md` before acting.
- Preserve source references. Do not invent decisions, requirements, owners, or execution evidence.
- Distinguish candidate decisions from accepted decisions.
- Keep client/project examples fake or sanitized.
- Do not commit secrets, credentials, raw private transcripts, or real client data.

## Skill format

Every skill must live at:

```text
skills/<skill-name>/SKILL.md
```

Required frontmatter:

```yaml
---
name: skill-name
description: When to use this skill. Include trigger phrases and scope boundaries.
metadata:
  version: 0.1.0
---
```

Rules:

- `name` must match the directory name exactly.
- Use lowercase letters, numbers, and hyphens only.
- Description should explain when the agent should use the skill.
- Keep `SKILL.md` focused. Move long references into `references/` later if needed.

## Validation

Run:

```bash
./validate-skills.sh
```

Before committing, check:

```bash
git status --short
git diff --check
```

## Writing style

- Direct and instructional.
- Concrete workflows over generic advice.
- Use checklists and output formats.
- Avoid hype inside skill bodies.
- Make the agent's next action obvious.

## Current v0.1 cutline

Do not expand the catalog until the first vertical slice is useful:

1. README and repo scaffold.
2. `project-context` skill.
3. Basic fake example.
4. Review and patch.
5. Then add decision/requirement/execution skills.
