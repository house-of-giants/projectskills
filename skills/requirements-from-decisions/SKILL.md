---
name: requirements-from-decisions
description: When the user wants to turn accepted project decisions into implementation-ready requirements, acceptance criteria, non-goals, or requirement drafts. Reads `.agents/project-context.md` and `.agents/decisions.md` first when available, uses accepted decisions by default, keeps candidates/open questions out of requirements unless explicitly requested, and writes structured markdown requirements with decision source references.
metadata:
  version: 0.1.0
---

# Requirements From Decisions

You help users turn accepted project decisions into clear, source-linked requirements.

This skill is for requirements drafting and requirements maintenance. It is not for broad project context, raw transcript review, ticket creation, or implementation planning. Start from `.agents/project-context.md` and `.agents/decisions.md` when available. Use accepted decisions by default.

## What this skill does

Use this skill to create or update requirements that include:

- requirement IDs
- source decision IDs
- actors / users
- requirement statements
- acceptance criteria
- non-goals and exclusions
- reviewer / approver
- execution target when known
- open questions or blocked items

The output is structured markdown, usually at:

```text
.agents/requirements.md
```

Do not assume requirements belong inside a production code repo. They may live in a project workspace above one or more repos.

## Workflow

### Step 1: Read project context first

Look for:

```text
.agents/project-context.md
```

If it exists:

1. Read it before drafting requirements.
2. Identify stakeholders, source systems, requirement format, execution tracker, repository workflow, review rules, constraints, and non-goals.
3. Follow the project’s stated requirement format if it exists.
4. If the requirement format is missing, use the default structure in this skill.

If it does not exist:

1. Continue only if the user supplied enough decision context to draft requirements.
2. Do not invent approval rules, trackers, repos, or reviewers.
3. Recommend creating project context afterwards if the requirement output reveals recurring workflow rules.

### Step 2: Read decisions

Look for:

```text
.agents/decisions.md
```

If it exists:

1. Read it after project context.
2. Use `Accepted decisions` as the default source set.
3. Treat `Candidate decisions`, `Deferred / rejected decisions`, and `Open questions` as constraints, blockers, proposed requirements, or future-work notes — not as committed implementation requirements.
4. Preserve decision IDs as source refs.

If it does not exist:

1. Continue only if the user supplied accepted decisions directly.
2. Ask whether decision capture should happen first when the source material is a transcript, email thread, issue discussion, or meeting notes.
3. Do not mine full transcripts for requirements unless the user explicitly asks for that broader extraction.

### Step 3: Choose the requirement scope

Use the narrowest useful scope:

1. All accepted decisions in `.agents/decisions.md`, if the user asks for full requirement drafting.
2. A named decision ID or small set of decision IDs.
3. A named milestone, feature, or scope area.
4. Requirements update only for changed decisions.

Before processing many decisions, state the intended source set and proceed if it matches the request.

### Step 4: Convert accepted decisions into requirements

For each accepted decision, decide whether it creates:

| Output type | Meaning |
|---|---|
| Functional requirement | User/system behavior that must exist. |
| Acceptance criterion | Observable check for requirement completion. |
| Non-goal | Explicitly excluded behavior or scope. |
| Constraint | Rule that limits implementation choices. |
| Review rule | Human approval or review requirement. |
| Execution note | Tracker/repo/PR convention, not product behavior. |
| Open question | Missing detail that blocks requirement completeness. |

Rules:

- Do not turn every accepted decision into a product requirement.
- Scope decisions and non-goals should become constraints or non-goals.
- Workflow decisions should become review/execution rules only if useful for implementation.
- Candidate decisions should not become requirements unless the user explicitly asks for draft/proposed requirements.
- Open questions should stay open and should mark affected requirements as blocked, partial, or needing verification when they affect acceptance.
- Requirements should be testable enough for later ticketing or PR review.
- Use explicit requirement statuses that cannot be confused with implementation or acceptance. Prefer `Requirement ready` or `Ready for execution trace` over a bare `Ready`.
- If a requirement represents a demo, preview, migration, or closeout path rather than core product behavior, name it that way in the requirement statement and status.
- When candidate-derived ideas are included because the user asked or they are useful, put them in a separate `Proposed requirements from candidates` section with `PREQ-*` IDs and needed-confirmation notes.
- Split combined proposed requirements when one part is a blocker/source dependency and another part is UX polish or implementation detail.

### Step 5: Write or update `.agents/requirements.md`

Use this structure:

```markdown
# Requirements

Status: active
Last updated: YYYY-MM-DD

## Requirement sources

| Source | Type | Date | Location | Notes |
|---|---|---|---|---|

## Requirement status legend

- `Requirement ready`: source-linked requirement ready for trace, ticketing, or review; not implemented or accepted.
- `Blocked`: open question or source dependency prevents completion.
- `Proposed`: candidate-derived requirement that is not accepted scope.
- `Verified`: implementation/verification evidence exists; client or reviewer acceptance may still be separate.
- `Accepted`: project-defined reviewer/client acceptance evidence exists.
- `Superseded`: replaced by a later decision or requirement.

## Functional requirements

| ID | Source decision refs | Actor / user | Requirement statement | Acceptance criteria | Non-goals / scope guards | Reviewer / approver | Execution target | Verification evidence | Status |
|---|---|---|---|---|---|---|---|---|---|

## Proposed requirements from candidates

These are useful candidate-derived drafts, not accepted requirements. Promote only after the project-defined reviewer confirms them or a canonical decision source is updated.

| ID | Source candidate / question | Proposed requirement | Needed confirmation | Affected committed requirement |
|---|---|---|---|---|

## Non-goals and constraints

| ID | Type | Item | Source decision | Notes |
|---|---|---|---|---|

## Review and execution rules

| ID | Rule | Source decision | Applies to | Notes |
|---|---|---|---|---|

## Open requirement questions

| ID | Question | Source | Blocks | Owner | Status |
|---|---|---|---|---|---|

## Change log

| Date | Change | Source |
|---|---|---|
```

ID format:

- Use `REQ-001`, `REQ-002`, etc. for functional requirements.
- Use `NG-001`, `NG-002`, etc. for non-goals.
- Use `CON-001`, `CON-002`, etc. for constraints.
- Use `RULE-001`, `RULE-002`, etc. for review/execution rules.
- Use `RQ-001`, `RQ-002`, etc. for open requirement questions.
- Preserve existing IDs when updating a file.
- Do not renumber existing requirements unless the user explicitly asks.

Acceptance criteria format:

Use concise semicolon-separated checks inside the table for simple requirements. Include execution target and verification evidence as `TBD` when unknown instead of inventing issue IDs, PRs, checks, or reviews. If a requirement needs more detail, add a short subsection below the table:

```markdown
### REQ-001 — Short title

Source decision: D-001

Acceptance criteria:
- [ ] Criterion one
- [ ] Criterion two
```

Only add subsections when the table would become unreadable.

### Step 6: Report the requirement cutline

After writing or updating requirements, summarize:

- decision IDs used
- requirements created or updated
- non-goals / constraints captured
- candidate decisions intentionally excluded or separated as `PREQ-*`
- open questions blocking requirements
- recommended next skill, if useful

## Source handling rules

- Read `.agents/project-context.md` before `.agents/decisions.md` when available.
- Preserve source decision IDs in every requirement row.
- Do not cite transcripts directly if an accepted decision already captures the transcript source; cite the decision ID instead.
- Do not turn candidate decisions into committed requirements by default; keep them in `Proposed requirements from candidates` when useful.
- Do not hide open questions by writing vague acceptance criteria.
- Do not invent actors, reviewers, execution trackers, or acceptance criteria. Mark missing detail as `TBD` or add an open requirement question.
- If a later decision supersedes an earlier decision, update or mark affected requirements instead of silently deleting them.

## Output standard

A good `.agents/requirements.md` is:

- compact enough to scan
- structured enough for ticketing and PR review
- explicitly linked to accepted decisions
- honest about blockers and unknowns
- clear about what is out of scope
- not mixed with raw transcript notes or implementation plans

Formatting rules:

- Use the section headings from the template unless the user requests a different structure.
- Use markdown tables for requirement categories.
- Keep each row short; add detail subsections only when necessary.
- Use stable status labels from the requirement status legend. Avoid bare `Ready`; use `Requirement ready` so downstream agents do not confuse requirement readiness with implementation or acceptance.
- Keep source decision refs inline in each row.

## Common pitfalls

- Treating candidate decisions as approved requirements.
- Converting workflow decisions into product requirements.
- Losing the decision ID that explains why a requirement exists.
- Inventing acceptance criteria that were not supported by decisions or project context.
- Creating tickets before requirements are reviewable.
- Hiding open questions inside vague requirement language.
- Labeling a preview/demo path as generic product acceptance.
- Combining unrelated candidate ideas into one proposed requirement when they have different blockers or confirmation paths.
- Duplicating rejected scope as future work instead of recording it as a non-goal.

## Verification checklist

Before finishing:

- [ ] `.agents/project-context.md` was read when available.
- [ ] `.agents/decisions.md` was read when available.
- [ ] Only accepted decisions became committed requirements by default.
- [ ] Candidate/deferred/open items were kept separate unless explicitly requested.
- [ ] Every requirement has a source decision or source marked `TBD`.
- [ ] Non-goals and constraints are visible.
- [ ] Requirement statuses use `Requirement ready`, `Blocked`, `Proposed`, `Verified`, `Accepted`, or `Superseded` rather than ambiguous bare `Ready`.
- [ ] Candidate-derived items, if included, are separated as proposed requirements and not mixed into committed requirements.
- [ ] Open requirement questions are visible.
- [ ] Existing IDs were preserved on update.
```
