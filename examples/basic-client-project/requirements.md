# Requirements

Status: active example
Last updated: 2026-05-15

## Requirement sources

| Source | Type | Date | Location | Notes |
|---|---|---|---|---|
| Project context | Context index | 2026-05-15 | `examples/basic-client-project/project-context.md` | Provides source systems, review rules, and scope boundaries. |
| Decisions | Decision record | 2026-05-15 | `examples/basic-client-project/decisions.md` | Accepted decisions D-001 through D-006 are the source for this requirement draft. |

## Functional requirements

| ID | Requirement | Source decision | Actor | Acceptance criteria | Reviewer | Status |
|---|---|---|---|---|---|---|
| REQ-001 | Customers can submit a support request through the portal. | D-001 | Customer | Customer can access request intake; customer can submit required request details; submitted request is visible to the operations team. | Mira | Draft |
| REQ-002 | Customers can upload account documents through the portal. | D-001 | Customer | Customer can select and upload a document; upload success or failure is visible; uploaded document is available to the operations team. | Mira | Blocked |

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
| RULE-003 | Mira reviews requirements before tickets are finalized. | D-006 | Requirement approval | Requirements remain draft until Mira review. |

## Open requirement questions

| ID | Question | Source | Blocks | Owner | Status |
|---|---|---|---|---|---|
| RQ-001 | What file types, size limits, and storage location should document upload support? | X-002 / Q-003 | REQ-002 | Mira | Open |
| RQ-002 | What counts as acceptance for document upload? | Q-003 | REQ-002 | Mira | Open |
| RQ-003 | Should customers receive email notifications in v1? | X-001 / Q-001 | No committed requirement yet | Mira / Jordan | Open |
| RQ-004 | Where should final decision notes live? | Q-002 | Future decision maintenance | Jordan / Mira | Open |

## Change log

| Date | Change | Source |
|---|---|---|
| 2026-05-15 | Created example requirements from accepted decisions. | `examples/basic-client-project/decisions.md` |
