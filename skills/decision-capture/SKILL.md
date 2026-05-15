---
name: decision-capture
description: When the user wants to extract, review, or maintain project decisions from transcripts, meeting summaries, notes, emails, issue threads, docs, or chat logs. Reads `.agents/project-context.md` first when available, selectively ingests source material only when decision extraction is the task, and writes structured markdown decisions with source references.
metadata:
  version: 0.1.0
---

# Decision Capture

You help users turn messy project source material into a compact, source-linked decision record.

This skill is for decision extraction and decision-log maintenance. It is not for creating broad project context, deriving requirements, or writing tickets. Start with `.agents/project-context.md` when it exists, then selectively read only the source material needed for the decision task.

## What this skill does

Use this skill to capture:

- accepted decisions
- candidate decisions that need confirmation
- deferred or rejected options
- open questions that block decisions
- source references for each item
- owners or approvers when known
- changes to prior decisions when clearly stated

The output is structured markdown, usually at:

```text
.agents/decisions.md
```

Do not assume the decision file belongs inside a production code repo. It may live in a project workspace above one or more repos.

## Workflow

### Step 1: Read project context first

Look for:

```text
.agents/project-context.md
```

If it exists:

1. Read it before reviewing decision sources.
2. Identify source systems, transcript locations, decision locations, review rules, and approval boundaries.
3. Follow the project’s stated decision location if one exists.
4. If the project says there is no formal decision log yet, use `.agents/decisions.md` unless the user requests another path.

If it does not exist:

1. Continue only if the user supplied enough source material or source locations for decision capture.
2. Do not invent project governance.
3. Recommend creating project context afterwards if the decision output reveals recurring source systems or approval rules.

### Step 2: Confirm the source budget

Decision capture may require reading transcripts, but only because this task is explicitly about decisions.

Use the narrowest useful source set:

1. Existing `.agents/decisions.md`, if present.
2. User-provided excerpt or meeting summary.
3. A specific transcript, email thread, doc, issue, or chat link named by the user.
4. A small batch of source files for a date range or milestone.
5. Full transcript corpus only if the user explicitly asks for broad decision discovery.

Before reading many large files, state the intended source set and proceed if it matches the user’s request. If the request is broad but ambiguous, prefer the most recent or named source first.

### Step 3: Classify decision-like material

Classify each item as one of:

| Status | Meaning |
|---|---|
| Accepted | The source clearly says the decision was made, approved, or agreed. |
| Candidate | The source implies a likely direction, but approval is unclear. |
| Deferred | The source says the decision was postponed or needs later review. |
| Rejected | The source says an option is out of scope or will not be pursued. |
| Superseded | A later decision replaces this item. |

Rules:

- Do not upgrade a candidate to accepted unless the source or user clearly confirms it.
- Treat “we should probably” / “I think” / “let’s consider” as candidate unless followed by approval.
- Treat explicit exclusions as accepted non-goal decisions when the source clearly confirms them.
- Keep open questions separate from decisions.
- Preserve uncertainty instead of smoothing it away.

### Step 4: Write or update `.agents/decisions.md`

Use this structure:

```markdown
# Decisions

Status: active
Last updated: YYYY-MM-DD

## Decision sources

| Source | Type | Date | Location | Notes |
|---|---|---|---|---|

## Accepted decisions

| ID | Decision | Source | Date | Owner / approver | Notes |
|---|---|---|---|---|---|

## Candidate decisions

| ID | Candidate decision | Source | Date | Needs confirmation from | Notes |
|---|---|---|---|---|---|

## Deferred / rejected decisions

| ID | Status | Item | Source | Date | Notes |
|---|---|---|---|---|---|

## Open questions

| ID | Question | Source | Owner | Status | Notes |
|---|---|---|---|---|---|

## Change log

| Date | Change | Source |
|---|---|---|
```

ID format:

- Use `D-001`, `D-002`, etc. for accepted decisions.
- Use `C-001`, `C-002`, etc. for candidate decisions.
- Use `X-001`, `X-002`, etc. for deferred/rejected/superseded decisions.
- Use `Q-001`, `Q-002`, etc. for open questions.
- Preserve existing IDs when updating a file.
- Do not renumber existing decisions unless the user explicitly asks.

### Step 5: Report the review cutline

After writing or updating decisions, summarize:

- sources reviewed
- accepted decisions captured
- candidate decisions needing confirmation
- rejected/deferred items
- open questions
- any source gaps or confidence issues
- recommended next skill, if useful

## Source handling rules

- Read `.agents/project-context.md` before source material when available.
- Preserve source links, filenames, transcript timestamps, issue numbers, email subjects, or doc titles when available.
- Do not paste large transcript excerpts into `.agents/decisions.md`.
- Short quotes are allowed only when they materially clarify a decision and are not sensitive.
- Do not copy private raw transcripts into the project workspace unless the user explicitly asks and the project permits it.
- Do not treat a transcript as authoritative if later email, issue, or approval notes supersede it.
- If two sources conflict, mark the item as candidate or open until resolved.
- If a decision affects scope, requirements, acceptance, pricing, timeline, privacy, security, or client approval, make that visible in notes.

## Output standard

A good `.agents/decisions.md` is:

- compact enough to read quickly
- structured enough for later skills to parse
- source-linked enough to audit
- conservative about acceptance status
- explicit about who needs to confirm unresolved items
- separate from raw transcripts and notes

Formatting rules:

- Use the section headings from the template unless the user requests a different structure.
- Use markdown tables for all decision categories.
- Keep each row short; move nuance into notes only when needed.
- Use stable status labels: `Accepted`, `Candidate`, `Deferred`, `Rejected`, `Superseded`, `Open`, `Resolved`.
- Keep source refs inline in the row.

## Common pitfalls

- Treating every discussion point as a decision.
- Calling a decision accepted when the source only shows preference or brainstorming.
- Losing source references during summarization.
- Dumping transcript text into the decision file.
- Reading an entire transcript corpus when the user named one source.
- Creating a decision log in the production repo when the project context points to a workspace-level `.agents` directory.
- Mixing requirements and implementation tasks into the decision log.

## Verification checklist

Before finishing:

- [ ] `.agents/project-context.md` was read when available.
- [ ] Source set reviewed is explicit.
- [ ] `.agents/decisions.md` exists or the user declined creation.
- [ ] Accepted decisions are separate from candidates.
- [ ] Open questions are separate from decisions.
- [ ] Source refs are present or marked `TBD`.
- [ ] Existing IDs were preserved on update.
- [ ] No large raw transcript excerpts were copied accidentally.
```
