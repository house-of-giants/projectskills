---
name: execution-trace
description: When the user wants to connect requirements to execution evidence such as tickets, PRs, commits, releases, checks, demos, or verification notes. Reads `.agents/project-context.md` and `.agents/requirements.md` first when available, preserves requirement IDs, avoids claiming completion without evidence, and writes a structured `.agents/execution-trace.md` delivery trace.
metadata:
  version: 0.1.0
---

# Execution Trace

You help users connect project requirements to concrete delivery evidence.

This skill is for traceability: requirements to tickets, PRs, commits, checks, releases, demos, review notes, and known gaps. It is not for creating broad project context, extracting decisions, drafting requirements, or implementing code. Start from `.agents/project-context.md` and `.agents/requirements.md` when available.

## What this skill does

Use this skill to track:

- which requirements have execution artifacts
- which tickets or issues represent the work
- which PRs, commits, or releases implement the work
- what verification evidence exists
- what is blocked, unlinked, or missing verification
- what shipped but still needs review
- what scope guards or non-goals must remain protected

The output is structured markdown, usually at:

```text
.agents/execution-trace.md
```

Do not assume trace files belong inside a production code repo. They may live in a project workspace above one or more repos.

## Workflow

### Step 1: Read project context first

Look for:

```text
.agents/project-context.md
```

If it exists:

1. Read it before tracing execution.
2. Identify execution tracker, repository / PR workflow, review rules, source systems, and delivery closeout expectations.
3. Follow the project’s stated tracker and repo conventions.
4. Do not invent tracker URLs, repo names, PRs, or review rules.
5. If the requested skill path is missing but a vendor copy is used, record that as an installation/source gap rather than silently proceeding.

If it does not exist:

1. Continue only if the user supplied enough requirement and execution context.
2. Do not invent workflow rules.
3. Recommend creating project context afterwards if execution trace reveals recurring tracker/repo/review conventions.

### Step 2: Read requirements

Look for:

```text
.agents/requirements.md
```

If it exists:

1. Read it after project context.
2. Use functional requirements as the primary trace set.
3. Treat non-goals and constraints as scope guards.
4. Treat open requirement questions as blockers or gaps, not shipped work.
5. Preserve requirement IDs in every trace row.

If it does not exist:

1. Continue only if the user supplied specific requirements directly.
2. Ask whether requirements should be drafted first if the user only provided decisions, transcript notes, or vague feature descriptions.
3. Do not create tickets or PR trace rows without requirement-level source context unless the user explicitly asks for an inventory.

### Step 3: Choose the trace scope

Use the narrowest useful scope:

1. All requirements in `.agents/requirements.md`, if the user asks for a full trace.
2. A named requirement ID or small set of IDs.
3. A named milestone, feature, PR, release, or tracker issue.
4. Requirements changed since the last trace update.

Before scanning many repos, tickets, or PRs, state the intended source set and proceed if it matches the request.

### Step 4: Gather execution evidence

Use available source systems from project context and user instructions.

Common sources:

| Source | Evidence |
|---|---|
| Linear / Jira / GitHub Issues | Tickets, statuses, assignees, links, comments. |
| GitHub / GitLab | PRs, commits, checks, reviews, release tags. |
| CI / test output | Passing/failing checks and verification notes. |
| Demo / QA notes | Screenshots, demo links, manual verification, client review notes. |
| Requirements file | Requirement IDs, status, blockers, non-goals. |

Rules:

- Do not claim a requirement is complete without linked evidence.
- If a ticket exists but no PR or verification exists, mark the requirement as `In progress` or `Needs verification`.
- If a PR merged but no acceptance evidence exists, mark it as `Implemented / pending verification`.
- If implementation and tests exist but expected PR/check/client evidence was not independently verified, mark it as `Implemented / pending verification` or `Needs verification` and add a gap for unverified live evidence.
- If shipped but not client-reviewed, mark it as `Shipped / pending review`.
- If no ticket/PR exists, mark it as `Unlinked`.
- If open questions block a requirement, mark it as `Blocked` and cite the question IDs.
- Non-goals should be traced as scope guards when relevant, not as implementation tasks.

### Step 5: Write or update `.agents/execution-trace.md`

Use this structure:

```markdown
# Execution Trace

Status: active
Last updated: YYYY-MM-DD

## Trace sources

| Source | Type | Date / range | Location | Notes |
|---|---|---|---|---|

## Trace status legend

- `Unlinked`: no issue, PR, commit, test, demo, or review evidence found.
- `Planned`: tracker evidence exists, but implementation evidence is not present.
- `In progress`: active tracker, branch, or PR evidence exists.
- `Implemented / pending verification`: implementation evidence exists, but verification or review is incomplete.
- `Needs verification`: evidence is partial, stale, unverified, or missing an expected review/check.
- `Shipped / pending review`: release, demo, or handoff evidence exists, but reviewer/client review is missing.
- `Accepted`: project-defined reviewer/client acceptance evidence exists.
- `Blocked`: open dependency prevents completion.
- `Superseded`: requirement was replaced by a later decision/requirement.

## Requirement trace

| Requirement | Requirement status | Tracker | PR / commit / release | Verification | Trace status | Notes |
|---|---|---|---|---|---|---|

## Scope guards

| Non-goal / constraint | Source | Guardrail | Evidence | Status | Notes |
|---|---|---|---|---|---|

## Verification evidence

| ID | Requirement | Evidence | Result | Date | Notes |
|---|---|---|---|---|---|

## Blockers / gaps

| ID | Requirement | Gap | Owner | Status | Notes |
|---|---|---|---|---|---|

## Local command outputs

Use this section only when local checks were run during the trace. Keep it concise: command, result, date, and a short summary. Do not paste large raw logs.

| Command | Result | Date | Notes |
|---|---|---|---|

## Change log

| Date | Change | Source |
|---|---|---|
```

Evidence ID format:

- Use `EV-001`, `EV-002`, etc. for verification evidence.
- Use `GAP-001`, `GAP-002`, etc. for blockers/gaps.
- Preserve existing IDs when updating a file.
- Do not renumber existing trace evidence unless the user explicitly asks.

### Step 6: Report the trace cutline

After writing or updating the trace, summarize:

- requirements traced
- requirements with no linked execution
- implemented items needing verification
- blockers / gaps
- shipped items pending review
- accepted items with evidence
- recommended next action, if useful

## Source handling rules

- Read `.agents/project-context.md` before `.agents/requirements.md` when available.
- Preserve requirement IDs in every trace row.
- Preserve tracker IDs, PR numbers, commit SHAs, check names, release tags, and demo/review links when available.
- Distinguish local git evidence from live PR/check verification. PR numbers found in merge commits or tracker attachments are not the same as independently verified PR content/check results.
- Do not invent ticket IDs, PRs, commits, checks, or review outcomes.
- Do not claim acceptance unless the project’s review rule is satisfied.
- Do not mark code as complete just because a PR exists.
- If evidence conflicts, mark the trace as `Needs verification` or `Blocked` and explain the conflict.
- Be precise when citing schema/test evidence. If a test rejects an unsupported node type, do not word it as rejecting a similarly named valid payload or field unless the evidence proves that exact claim.
- Assign source-verification gaps to the operator/system that can verify them, not automatically to a person named in the project context.
- Keep future polish or out-of-scope work separate from requirement gaps.

## Output standard

A good `.agents/execution-trace.md` is:

- compact enough to scan
- explicit about evidence and gaps
- honest about verification status
- linked to requirements, tickets, PRs, and checks when available
- clear about what shipped, what is blocked, and what still needs review
- not mixed with implementation plans or raw logs

Formatting rules:

- Use the section headings from the template unless the user requests a different structure.
- Use markdown tables for trace categories.
- Keep each row short; link to evidence instead of copying logs.
- Use stable status labels from this skill.
- Preserve the requirement's own status as written, but prefer unambiguous requirement statuses such as `Requirement ready` over bare `Ready` when updating requirements as part of trace hygiene.
- Keep requirement IDs inline in every relevant row.

## Common pitfalls

- Claiming completion from a ticket status alone.
- Claiming acceptance without reviewer/client evidence.
- Treating merged PRs as verified requirements.
- Treating locally observed PR numbers as live GitHub verification.
- Using broad evidence wording that accidentally rules out valid payloads, fields, or future scope.
- Losing requirement IDs when summarizing delivery.
- Mixing future polish with blocked requirement gaps.
- Turning non-goals into implementation tasks.
- Copying large CI logs or raw PR text into the trace file.

## Verification checklist

Before finishing:

- [ ] `.agents/project-context.md` was read when available.
- [ ] `.agents/requirements.md` was read when available.
- [ ] Requirement IDs are preserved in trace rows.
- [ ] Tracker/PR/commit/check evidence is linked when available.
- [ ] Completion is not claimed without evidence.
- [ ] Client/reviewer acceptance is not claimed without review evidence.
- [ ] Live tracker/PR/check verification gaps are explicit when only local git or local tests were available.
- [ ] Scope guard evidence is worded narrowly enough not to reject valid adjacent schema/payload concepts.
- [ ] Blockers and gaps are visible.
- [ ] Existing evidence IDs were preserved on update.
```
