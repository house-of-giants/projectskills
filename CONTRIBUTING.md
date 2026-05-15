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

## Skill quality checklist

- [ ] Directory name matches `name` exactly.
- [ ] Description explains when to use the skill.
- [ ] Skill reads `.agents/projectskills/project-context.md` first when project context matters.
- [ ] Skill preserves source refs.
- [ ] Skill avoids inventing decisions, requirements, or execution evidence.
- [ ] Skill produces a concrete artifact or clearly structured output.
- [ ] No real client/private data is included.
- [ ] `./validate-skills.sh` passes.

## Examples

Examples should be fake or heavily sanitized. They should show the before/after workflow clearly.

## License

By contributing, you agree that your contribution is licensed under the MIT license.
