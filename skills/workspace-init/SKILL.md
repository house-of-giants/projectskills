---
name: workspace-init
description: When the user wants to initialize an existing project workspace for Project Skills before project context exists. Use when they have a parent folder with one or more repo folders but no `.agents/`, `ops/`, scratch area, agent instructions, or project context files yet. Scaffolds a clean workspace without moving app code unless explicitly asked.
version: 0.1.0
author: House of Giants
license: MIT
metadata:
  hermes:
    tags: [project-skills, workspace, init, setup, context]
    related_skills: [project-context, decision-capture, requirements-from-decisions, execution-trace]
---

# Workspace Init

## Overview

Use this skill to set up the filesystem shape Project Skills expects when a user is bringing an existing project into an agent-friendly workspace.

This skill runs before `project-context`. It creates the durable project workspace layer:

```text
<project-workspace>/
  .agents/
    skills/                 # installed Project Skills, if present
    source/                 # ignored local source drops, optional
    project-context.md      # created later by project-context
    decisions.md            # created later by decision-capture
    requirements.md         # created later by requirements-from-decisions
    execution-trace.md      # created later by execution-trace
  ops/                      # curated project/business/source context
  scratch/                  # local throwaway work
  <repo-folder>/            # existing app/repo folder, not moved by default
  AGENTS.md                 # generic/Codex instructions
  CLAUDE.md                 # Claude Code instructions
  .gitignore                # workspace-level ignore rules
```

Do not assume `.agents/` belongs inside the production repo. The safer default is a parent workspace that contains both `.agents/` and the app repo folder.

## When to Use

Use this when:

- The user says “init”, “initialize”, “set up project context”, “scaffold Project Skills”, or similar.
- The user has created a parent folder around an existing repo but not the rest of the workspace.
- The user wants to move an existing project into Project Skills without polluting the production repo.
- The user needs `AGENTS.md`, `CLAUDE.md`, `.agents/`, `ops/`, and `scratch/` defaults.

Do not use this when:

- `.agents/project-context.md` already exists and the task is to update project context — use `project-context`.
- The user wants to extract decisions — use `decision-capture`.
- The user wants requirements or traceability — use the downstream skills.
- The user explicitly wants files created inside the app repo; confirm before doing that.

## Default Behavior

1. Treat the current directory as the project workspace unless the user names another path.
2. Detect existing repo folders by looking for immediate child directories containing `.git`.
3. If exactly one repo folder is found, reference it in generated instructions.
4. If multiple repo folders are found, list them and write repo references as `TBD` rather than guessing.
5. Create only safe workspace scaffolding:
   - `.agents/`
   - `.agents/source/`
   - `ops/`
   - `scratch/`
   - `AGENTS.md`
   - `CLAUDE.md`
   - workspace `.gitignore`
6. Do not move, rename, delete, or rewrite the existing repo folder unless explicitly instructed.
7. Do not copy raw transcripts, secrets, `.env` files, or private source dumps into committed paths.
8. If Project Skills are already installed under `.agents/skills/`, preserve them.
9. If skills are not installed, tell the user the exact install command.

## Workspace Discovery

Before writing files, inspect the workspace:

```bash
pwd
find . -maxdepth 2 -name .git -type d
find . -maxdepth 1 -type d | sort
```

Use shell-equivalent discovery appropriate to the agent environment. The goal is to identify:

- workspace root
- existing app/repo folders
- whether `.agents/` already exists
- whether `AGENTS.md` or `CLAUDE.md` already exists
- whether `.gitignore` already exists

If a file already exists, update it conservatively or append a clearly marked Project Skills section. Do not overwrite user instructions.

## Files to Create

### `.agents/.gitkeep`

Create this only if needed to keep the folder visible in git. It is optional.

### `.agents/source/.gitignore`

```gitignore
# Local source drops, raw transcripts, exports, and private files.
*
!.gitignore
```

### `ops/README.md`

```markdown
# Ops Context

Curated project/source context for agents.

Use this folder for summaries, source indexes, scope notes, decision-log exports, and other project context that should sit beside the app repo rather than inside it.

Do not commit secrets, raw transcript dumps, private exports, or files that should remain local-only.
```

### `scratch/.gitignore`

```gitignore
*
!.gitignore
```

### Workspace `.gitignore`

Append these entries if missing:

```gitignore
# Project Skills local/source material
.agents/source/
scratch/

# raw exports / transcript dumps
**/*.raw.json
**/*.transcript.txt
**/*.transcript.md

# local environment files
.env
.env.*
*.local
```

If the workspace root is itself a git repo, this `.gitignore` may be committed. If the workspace root is not a git repo, still create it as local hygiene.

### `AGENTS.md`

Create or append:

```markdown
# Agent Instructions

This workspace uses Project Skills.

## Workspace shape

- `.agents/` stores project context artifacts and installed skills.
- `ops/` stores curated project/source context outside the production repo.
- `scratch/` is local throwaway work.
- `<repo-folder>/` is the implementation repo. Verify the actual path before editing code.

## Load order

Before project-context, decision, requirements, execution trace, or delivery closeout work:

1. Read `.agents/project-context.md` if it exists.
2. Read the relevant skill from `.agents/skills/<skill-name>/SKILL.md` if installed.
3. Preserve source references, open questions, and uncertainty.
4. Do not claim implementation, verification, or acceptance without evidence.

## Project Skills

Common workflow:

1. `workspace-init` — scaffold this workspace if needed.
2. `project-context` — create `.agents/project-context.md`.
3. `decision-capture` — create/update `.agents/decisions.md`.
4. `requirements-from-decisions` — create/update `.agents/requirements.md`.
5. `execution-trace` — create/update `.agents/execution-trace.md`.

## Safety rules

- Do not move or rewrite the app repo unless explicitly instructed.
- Do not ingest raw transcripts by default.
- Do not commit secrets, `.env` files, raw exports, or private source dumps.
- Treat tracker status, merged PRs, and local tests as evidence, not acceptance.
```

Replace `<repo-folder>` with the detected repo folder when exactly one exists. Otherwise leave it as `TBD` and list candidate repo folders.

### `CLAUDE.md`

Create or append:

```markdown
# Claude Code Instructions

Read `AGENTS.md` first.

Project Skills live in `.agents/skills/` when installed. If a requested skill is missing, ask the user to install Project Skills or use the checked-out skill source the user points to.

Generated project artifacts should live at the workspace root under `.agents/`, not inside the production app repo unless explicitly requested.
```

## Optional Skill Installation

If Project Skills are not already installed, suggest one of these commands.

Install all skills into the current workspace:

```bash
npx skills add house-of-giants/projectskills --skill '*'
```

Install all skills for Claude Code and Codex:

```bash
npx skills add house-of-giants/projectskills --skill '*' -a claude-code -a codex
```

Do not run global install by default. Project-local install is safer for client/project-specific workflows.

## Output Summary

After initialization, summarize:

- workspace path
- detected repo folders
- files/directories created
- files updated instead of overwritten
- whether Project Skills appear installed
- exact next prompt to run `project-context`

Use this next prompt shape:

```text
Use the project-context skill to create .agents/project-context.md for this workspace.

Read AGENTS.md first.
Inspect the workspace structure and the implementation repo folder.
Record where source systems, docs, notes, transcripts, tickets, and repos live, but do not ingest full transcripts by default.
```

## Common Pitfalls

- Putting `.agents/` inside the app repo when the user wanted a parent workspace.
- Moving the existing repo folder without explicit instruction.
- Overwriting existing `AGENTS.md`, `CLAUDE.md`, or `.gitignore` content.
- Treating raw transcript/source folders as committed context.
- Installing skills globally when project-local install is the safer default.
- Running `project-context` before creating a stable workspace shape.

## Verification Checklist

Before finishing:

- [ ] `.agents/`, `ops/`, and `scratch/` exist.
- [ ] Raw/source material paths are ignored or clearly local-only.
- [ ] Existing app/repo folders were not moved or modified unless explicitly requested.
- [ ] `AGENTS.md` and `CLAUDE.md` exist or were intentionally skipped.
- [ ] Workspace `.gitignore` includes `.agents/source/`, `scratch/`, raw transcript/export patterns, and env patterns.
- [ ] User has a clear next prompt for `project-context`.
```