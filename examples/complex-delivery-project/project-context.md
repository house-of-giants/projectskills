# Project Context

Status: active example
Last updated: 2026-05-18

## Project overview

FieldOps Offline is a fake delivery project for a desktop-first field inspection workflow app. Inspectors need to prepare inspection routes, collect structured notes and photos offline, then export a review package when they return to connectivity.

The project workspace is organized as:

```text
fieldops-offline/
  .agents/
  ops/
  app/
```

## Freshness warning

This example is generated from local snapshots and fake tracker/repo evidence. In a real project, verify live tracker status, PR status, checks, release artifacts, blockers, and client acceptance before making delivery claims. Local notes are routing context, not live truth.

## Stakeholders and roles

| Person / group | Role | Notes |
|---|---|---|
| Mira Chen | Client product lead | Day-to-day reviewer for workflow behavior. |
| Jordan Lee | Client operations sponsor | Final milestone acceptance. |
| Alex Rivera | Delivery lead | Internal approver for decision-log updates and requirements. |
| Field inspectors | Primary users | Work in low-connectivity environments. |

## Source systems

| System | Role | Link / location | Notes |
|---|---|---|---|
| Tracker | Execution tracker | `TRACKER-PROJECT-FIELDOPS` | Live status must be verified before claims. |
| Decision Log | Canonical accepted decisions | `ops/decision-log.md` | Local fake canonical source for this example. |
| Scope brief | Contract/scope cutline | `ops/scope-brief.md` | Older brief text can be superseded by accepted decisions. |
| Meeting packet | Decision candidates | `ops/meeting-packets/2026-05-12-review.md` | Use for candidates/open questions unless accepted in Decision Log. |
| Git repository | Implementation surface | `app/` | PR/check evidence must be verified before acceptance claims. |
| Project Skills | Local skill workflows | `.agents/skills/` | Skills used to generate/update project context, decisions, requirements, and trace. |

## Decision log

| Status | Location | Notes |
|---|---|---|
| Accepted decisions | `ops/decision-log.md` | Canonical for accepted fake DL-* decisions. |
| Candidate decisions | `ops/meeting-packets/` | Require Alex review before promotion. |
| Historical scope | `ops/scope-brief.md` | Useful for contract cutline, but stale language may be superseded. |

## Requirement format

Requirements should include stable ID, source decision refs, actor, requirement statement, acceptance criteria, non-goals/scope guards, reviewer, execution target, verification evidence, and status.

## Execution tracker

| Tracker | Status | Notes |
|---|---|---|
| Tracker project | Active | Issues should cite requirement IDs and accepted decision refs. |
| Local action notes | Supplement only | Not a substitute for live tracker state. |

## Repository / PR workflow

| Area | Rule |
|---|---|
| App repo | Work happens in `app/`. |
| PR linkage | PRs should cite requirement IDs and DL-* refs. |
| Checks | Typecheck, unit tests, and export fixture tests are minimum local verification. |
| Acceptance | Merged PRs and green checks do not equal client acceptance. |

## Review and approval rules

| Area | Reviewer / approver | Rule |
|---|---|---|
| Accepted decisions | Alex Rivera | Promote only after source review. |
| Milestone acceptance | Jordan Lee | Requires review evidence or written acceptance. |
| Workflow details | Mira Chen | Reviews behavior and UX before final acceptance. |

## Delivery closeout expectations

Record delivered scope, requirement IDs, decision refs, tracker issues, PRs, checks, export artifacts, demo/review notes, deferred work, and acceptance status.

## Execution trace rules

- `Accepted` requires Jordan/Mira review evidence or the project acceptance rule.
- Merged PRs, closed tracker issues, and local checks do not by themselves prove acceptance.
- Missing issue/PR/check/demo/review evidence should become `Unlinked`, `Needs verification`, or a visible gap.
- Open source dependencies should mark affected requirements as blocked or partial.
- Non-goals and constraints should be tracked as scope guards, not implementation tasks.

## Constraints and non-goals

| Type | Item | Status | Source |
|---|---|---|---|
| Constraint | App must support offline inspection capture. | Accepted | DL-001 |
| Constraint | Export package is the handoff artifact; sync service is out of v1. | Accepted | DL-004 / DL-006 |
| Constraint | Review package filenames must be safe across macOS, Windows, and Linux. | Accepted | DL-008 |
| Non-goal | Real-time cloud sync is out of v1. | Accepted | DL-006 |
| Non-goal | Billing, scheduling, and workforce management are out of v1. | Accepted | Scope brief |

## Project vocabulary

| Term | Meaning |
|---|---|
| Inspection package | Exported folder containing inspection JSON, photos, and review manifest. |
| Draft route | Locally prepared inspection route before field work. |
| Review manifest | Generated summary file used by operations reviewers. |
| Offline capture | User workflow that does not require network calls during field work. |

## Open questions

| Question | Status | Source / owner |
|---|---|---|
| Which three photo metadata fields are required for acceptance? | Open | Mira |
| Has the final export fixture set been approved? | Open | Jordan / Mira |
| What evidence establishes milestone acceptance beyond demo readiness? | Open | Jordan |

## Change log

| Date | Change | Source |
|---|---|---|
| 2026-05-18 | Created public-safe complex delivery example context. | Fake sources |
