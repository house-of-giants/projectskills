# Contributing

Thanks for your interest in Project Skills.

This repository is early. The goal is to build small, practical, installable skills that help AI agents preserve project context across real delivery work.

## Suggesting a skill

Good skill ideas usually fit this pattern:

- They happen repeatedly in project work.
- They connect project context to execution.
- They produce a concrete artifact.
- They reduce context loss between humans and agents.

Examples:

- Capture decisions from meeting notes.
- Turn decisions into requirements.
- Link requirements to PRs.
- Close out what shipped and what remains.

## Adding a skill

Create:

```bash
mkdir -p skills/your-skill-name
$EDITOR skills/your-skill-name/SKILL.md
```

Every skill needs YAML frontmatter:

```yaml
---
name: your-skill-name
description: When to use this skill. Include trigger phrases and scope boundaries.
metadata:
  version: 0.1.0
---
```

Then write clear instructions for the agent.

Optional but recommended: add a small eval file for behavior that should not regress.

```bash
mkdir -p skills/your-skill-name/evals
$EDITOR skills/your-skill-name/evals/evals.json
```

Keep evals lightweight. They should describe prompts, expected output, assertions, and optional files. Use them to protect important behavior, not to create a heavyweight test suite.

## Skill quality checklist

- [ ] Directory name matches `name` exactly.
- [ ] Description explains when to use the skill.
- [ ] Skill reads `.agents/project-context.md` first when project context matters.
- [ ] Skill preserves source refs.
- [ ] Skill avoids inventing decisions, requirements, or execution evidence.
- [ ] Skill produces a concrete artifact or clearly structured output.
- [ ] Important behavior has a tiny eval, when useful.
- [ ] No real client/private data is included.
- [ ] `./validate-skills.sh` passes.

## Examples

Examples should be fake or heavily sanitized. They should show the before/after workflow clearly.

## License

By contributing, you agree that your contribution is licensed under the MIT license.
