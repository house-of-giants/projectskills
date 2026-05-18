# Requirements

Status: active example
Last updated: 2026-05-15

## Requirement sources

| Source | Type | Date | Location | Notes |
|---|---|---|---|---|
| Project context | Context index | 2026-05-15 | `examples/basic-client-project/project-context.md` | Provides source systems, review rules, and scope boundaries. |
| Decisions | Decision record | 2026-05-15 | `examples/basic-client-project/decisions.md` | Accepted decisions D-001 through D-006 are the source for committed requirements. |

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
| REQ-001 | D-001 | Customer | Customers can submit a support request through the portal. | Customer can access request intake; customer can submit required request details; submitted request is visible to the operations team. | CON-001; NG-001; NG-002 | Mira | Linear issue TBD | TBD | Requirement ready |
| REQ-002 | D-001; Q-003 | Customer | Customers can upload account documents through the portal after file type, size, storage, and acceptance details are defined. | Customer can select and upload a document; upload success or failure is visible; uploaded document is available to the operations team; file constraints and acceptance checks are confirmed. | CON-001; NG-001; NG-002 | Mira | Linear issue TBD | TBD | Blocked |

## Proposed requirements from candidates

These are useful candidate-derived drafts, not accepted requirements. Promote only after the project-defined reviewer confirms them or a canonical decision source is updated.

| ID | Source candidate / question | Proposed requirement | Needed confirmation | Affected committed requirement |
|---|---|---|---|---|
| PREQ-001 | X-001 / Q-001 | Customers receive email notifications for support request or document-upload events. | Confirm whether notifications belong in v1 and which events trigger them. | No committed requirement yet |

## Non-goals and constraints

| ID | Type | Item | Source decision | Notes |
|---|---|---|---|---|
| NG-001 | Non-goal | Do not rebuild the full CRM in v1. | D-002 | v1 should stay focused on portal intake and document upload. |
| NG-002 | Non-goal | Billing and payments are out of scope for v1. | D-003 | Do not create requirements for invoices, payment methods, checkout, or payment status. |
| CON-001 | Constraint | First milestone is limited to support request intake and document upload. | D-001 | Other portal capabilities should be deferred unless explicitly approved. |

## Review and execution rules

| ID | Rule | Source decision | Applies to | Notes |
|---|---|---|---|---|
| RULE-001 | Delivery execution is tracked in Linear. | D-004 | Requirements and tickets | Linear issues should reference requirement IDs when available. |
| RULE-002 | Code review happens in GitHub. | D-005 | PRs | PRs should reference requirement IDs and verification evidence. |
| RULE-003 | Mira reviews requirements before tickets are finalized. | D-006 | Requirement approval | Requirements remain `Requirement ready` until Mira review, then can be marked `Accepted` only with review evidence. |

## Open requirement questions

| ID | Question | Source | Blocks | Owner | Status |
|---|---|---|---|---|---|
| RQ-001 | What file types, size limits, and storage location should document upload support? | X-002 / Q-003 | REQ-002 | Mira | Open |
| RQ-002 | What counts as acceptance for document upload? | Q-003 | REQ-002 | Mira | Open |
| RQ-003 | Should customers receive email notifications in v1? | X-001 / Q-001 | PREQ-001 | Mira / Jordan | Open |
| RQ-004 | Where should final decision notes live? | Q-002 | Future decision maintenance | Jordan / Mira | Open |

## Change log

| Date | Change | Source |
|---|---|---|
| 2026-05-15 | Created example requirements from accepted decisions. | `examples/basic-client-project/decisions.md` |
