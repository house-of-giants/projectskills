# Execution Trace

Status: active example
Last updated: 2026-05-15

## Trace sources

| Source | Type | Date / range | Location | Notes |
|---|---|---|---|---|
| Project context | Context index | 2026-05-15 | `examples/basic-client-project/project-context.md` | Provides tracker, repository, and review rules. |
| Requirements | Requirement record | 2026-05-15 | `examples/basic-client-project/requirements.md` | Functional requirements, non-goals, constraints, and open questions. |
| Linear | Execution tracker | TBD | Workspace/project TBD | No concrete issue links in this fake example yet. |
| GitHub | Code review | TBD | Repository TBD | No concrete PR links in this fake example yet. |

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
| REQ-001 | Requirement ready | Linear issue TBD | PR TBD | Verification TBD | Unlinked | Requirement exists for support request intake, but no execution evidence is linked yet. |
| REQ-002 | Blocked | Linear issue TBD | PR TBD | Verification blocked by RQ-001 and RQ-002 | Blocked | Document upload details and acceptance criteria are still open. |

## Scope guards

| Non-goal / constraint | Source | Guardrail | Evidence | Status | Notes |
|---|---|---|---|---|---|
| NG-001 | D-002 / `requirements.md` | Do not rebuild the full CRM in v1. | PR scope check TBD | Guarded / needs evidence | Future tickets/PRs should avoid CRM rebuild scope. |
| NG-002 | D-003 / `requirements.md` | Billing and payments are out of scope for v1. | PR scope check TBD | Guarded / needs evidence | Do not create implementation tasks for invoices, payment methods, checkout, or payment status. |
| CON-001 | D-001 / `requirements.md` | First milestone is limited to support request intake and document upload. | Milestone scope check TBD | Guarded / needs evidence | Other portal capabilities should be deferred unless explicitly approved. |

## Verification evidence

| ID | Requirement | Evidence | Result | Date | Notes |
|---|---|---|---|---|---|
| EV-001 | REQ-001 | TBD | Missing | 2026-05-15 | No ticket, PR, demo, or check evidence linked yet. |
| EV-002 | REQ-002 | RQ-001 / RQ-002 | Blocked | 2026-05-15 | Verification cannot be completed until document upload details are defined. |

## Blockers / gaps

| ID | Requirement | Gap | Owner | Status | Notes |
|---|---|---|---|---|---|
| GAP-001 | REQ-001 | No Linear issue linked. | Delivery operator | Open | Create or link the execution ticket when work starts. |
| GAP-002 | REQ-001 | No GitHub PR or verification evidence linked. | Delivery operator | Open | Add PR/check/demo evidence when implementation exists. |
| GAP-003 | REQ-002 | Document upload file types, size limits, storage location, and acceptance criteria are undefined. | Mira | Open | Mirrors RQ-001 and RQ-002 from requirements. |
| GAP-004 | REQ-002 | No Linear issue, PR, or verification evidence linked. | Delivery operator | Open | Blocked until requirement details are ready. |

## Local command outputs

| Command | Result | Date | Notes |
|---|---|---|---|
| None run | Not applicable | 2026-05-15 | Fake example has no local app repo or CI output. |

## Change log

| Date | Change | Source |
|---|---|---|
| 2026-05-15 | Created example execution trace from requirements. | `examples/basic-client-project/requirements.md` |
