---
name: project-context
description: When the user wants to create, update, or inspect project context for agent-assisted client/product work. Use when the user mentions project context, client context, decision locations, requirements, source systems, execution tracker, review rules, delivery workflow, or wants to avoid repeating foundational project information across agent tasks. Creates or updates `.agents/project-context.md`, which other Project Skills read first; records transcript locations without ingesting full transcripts by default.
metadata:
  version: 0.1.0
---

# Project Context

You help users create and maintain `.agents/project-context.md`, the foundational context file for a project.

This file may live in a production repository, but it does not have to. Many projects are better represented as a workspace that contains context, transcripts, notes, and one or more git repos.

Other Project Skills should read this file before capturing decisions, deriving requirements, tracing execution, or closing out delivery work.

## What this skill does

Use this skill to capture the stable project context an agent needs before helping with delivery work:

- what the project is
- who it is for
- where source truth lives
- where decisions are recorded
- how requirements should be written
- where execution happens
- how review and approval work
- what delivery closeout should include

This is not a full project management system. It is a compact, strictly formatted markdown scaffold that helps agents stop losing the plot between meetings, requirements, tickets, PRs, and documentation.

## Workflow

### Step 1: Check for existing context

Look for:

```text
.agents/project-context.md
```

If it exists:

1. Read it.
2. Summarize what is already captured.
3. Ask what changed or what section the user wants to update.
4. Preserve existing useful context unless it is clearly superseded.

If it does not exist:

1. Offer to create it.
2. Start from lightweight sources first: README, existing docs, repository metadata, issue tracker/project names, meeting summaries, user-provided notes, and known source-system locations.
3. Record transcript locations as source systems, but do not ingest full transcripts by default.
4. Only read full transcripts when the user explicitly asks for transcript-derived extraction, such as finding decision candidates, requirements, risks, or open questions.
5. If information is missing, leave explicit `Unknown` or `TBD` markers instead of inventing.

### Step 1.5: Choose the right workspace boundary

Do not assume the current git repository is the whole project.

Valid shapes include:

```text
# Context inside the production repo
repo/
  .agents/project-context.md
  src/

# Project workspace with repo inside
client-project/
  .agents/project-context.md
  transcripts/
  notes/
  app/                 # git repo

# Project workspace with multiple repos
client-project/
  .agents/project-context.md
  web-app/             # git repo
  api/                 # git repo
  docs/
```

Prefer the smallest workspace that matches how the project is actually run. If source truth lives in transcripts, email, Linear/Jira, GitHub issues, CRM notes, or external docs, point to those systems. Do not require teams to commit formal decision logs or raw meeting transcripts into production code repos.

### Step 2: Gather project context

Capture only what is useful for future agent work.

Ask concise questions if needed, but prefer drafting from available source material first.

Source budget order:

1. Existing `.agents/project-context.md`, if present.
2. User-provided project summary or notes.
3. README / repo metadata / package names / docs index.
4. Tracker/project names and source-system locations.
5. Meeting summaries or transcript summaries.
6. Full transcripts only on explicit request or when the user supplies a small excerpt for this task.

Default behavior: identify where transcripts live and what role they play; do not load or summarize the full transcript corpus while creating basic project context.

Required sections:

1. Project overview
2. Freshness warning
3. Stakeholders and roles
4. Source systems
5. Decision log
6. Requirement format
7. Execution tracker
8. Repository / PR workflow
9. Review and approval rules
10. Delivery closeout expectations
11. Execution trace rules
12. Constraints and non-goals
13. Project vocabulary
14. Open questions

If the context is generated from local snapshots, local repo inspection, exported docs, or stale mirrors, include a `## Freshness warning` that says which facts must be re-verified before status, acceptance, blocker, or delivery claims. If the project has live systems such as Linear, GitHub, Jira, email, or CI, make clear that local snapshots are routing context, not current truth.

### Step 3: Write `.agents/project-context.md`

Use this structure:

```markdown
# Project Context

Status: active
Last updated: YYYY-MM-DD

## Project overview

## Freshness warning

## Stakeholders and roles

## Source systems

| System | Role | Link / location | Notes |
|---|---|---|---|

## Decision log

## Requirement format

## Execution tracker

## Repository / PR workflow

## Review and approval rules

## Delivery closeout expectations

## Execution trace rules

- `Accepted` requires the project-defined reviewer/client approval or acceptance evidence.
- Merged PRs, closed tickets, and local implementation evidence do not by themselves prove acceptance.
- Missing ticket/PR/check/demo/review evidence should become `Unlinked`, `Needs verification`, or a visible gap in execution trace work.
- Open source dependencies or unanswered requirement questions should mark affected requirements as blocked or partial.
- Non-goals and constraints should be tracked as scope guards, not implementation tasks.

## Constraints and non-goals

## Project vocabulary

## Open questions

## Change log
```

### Step 4: Report what changed

After creating or updating the file, summarize:

- sections created or updated
- unknowns left as `TBD`
- any decisions that still need confirmation
- recommended next skill, if any

## Source handling rules

- Preserve links and source refs when available.
- Do not copy private raw transcripts or sensitive source material unless the user explicitly asks and the project permits it.
- Do not read full transcripts just because a transcript folder or link exists. Treat transcript locations as source-system references unless transcript extraction is the task.
- Do not treat meeting notes as accepted decisions unless the notes say they were accepted or the user confirms.
- Do not invent stakeholders, trackers, repos, requirements, or approval rules.
- If a named approver/reviewer is explicit in the user's context or source material, record that named role/person directly instead of leaving a redundant `TBD` question. If authority is only implied, keep it role-based and mark it `TBD`.
- If a project uses a canonical decision log, point to it instead of creating a competing one.
- If a project does not use a formal decision log, capture the current decision source locations instead of pretending one exists.
- Do not assume decision logs, transcripts, or project notes belong inside the production repository.

## Output standard

A good `.agents/project-context.md` is:

- short enough to read quickly
- specific enough to guide future agent work
- explicit about source systems
- clear about review and approval boundaries
- honest about unknowns
- useful to downstream skills

Formatting rules:

- Preserve the section headings from the template unless the user explicitly asks for a different structure.
- Prefer markdown tables for source systems, stakeholders, decision locations, trackers, and review rules.
- Use stable labels such as `TBD`, `Unknown`, `Accepted`, `Candidate`, `Superseded`, and `Blocked` instead of prose-only status descriptions.
- Keep source links inline in the relevant row or bullet; do not collect them in a disconnected appendix.
- Keep entries concise enough for another agent to parse and update safely.
- Keep the context file as an index and operating guide, not a source-material digest.
- When local skills or agent instructions are part of the workspace, list their stable path as a source system or operating source so future agents can load the same workflow.
- Avoid ambiguous requirement or trace statuses such as bare `Ready` when they could be mistaken for implemented or accepted state; use phrases like `Requirement ready` or `Ready for execution trace` when needed.

## Common pitfalls

- Creating a giant knowledge base instead of a compact project context file.
- Treating every note as a decision.
- Losing source refs.
- Hiding unknowns instead of marking them `TBD`.
- Duplicating project management tools instead of pointing to them.
- Writing generic context that could apply to any project.
- Assuming every team has a committed `/docs/decisions` folder or formal ADR/decision-log process.
- Dumping raw transcripts into `.agents/project-context.md` instead of extracting stable context and linking to the transcript location.
- Burning context on full transcript ingestion when the task only needs source locations and operating rules.

## Verification checklist

Before finishing:

- [ ] `.agents/project-context.md` exists or the user declined creation.
- [ ] Source systems are listed.
- [ ] A freshness warning is included when any current-state facts came from local snapshots, local inspection, or exported docs.
- [ ] Decision log location is explicit or marked `TBD`.
- [ ] Requirement format is explicit or marked `TBD`.
- [ ] Execution tracker is explicit or marked `TBD`.
- [ ] Review rules are explicit or marked `TBD`.
- [ ] Unknowns are visible.
- [ ] No sensitive/private raw data was added accidentally.
```
