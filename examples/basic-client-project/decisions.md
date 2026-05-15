# Decisions

Status: active example
Last updated: 2026-05-15

## Decision sources

| Source | Type | Date | Location | Notes |
|---|---|---|---|---|
| Kickoff transcript excerpt | Transcript excerpt | 2026-05-15 | `examples/basic-client-project/transcript-excerpt.md` | Fake source used for the example. Real projects should usually link to the transcript tool/export location instead of copying full transcripts into the repo. |
| Project context | Context index | 2026-05-15 | `examples/basic-client-project/project-context.md` | Shows source systems and review rules used to interpret the transcript excerpt. |

## Accepted decisions

| ID | Decision | Source | Date | Owner / approver | Notes |
|---|---|---|---|---|---|
| D-001 | First milestone is limited to support request intake and document upload. | Kickoff transcript excerpt | 2026-05-15 | Jordan | Alex asked whether the first milestone should prove only these two flows; Jordan confirmed yes. |
| D-002 | The project should not become a full CRM rebuild in v1. | Kickoff transcript excerpt | 2026-05-15 | Jordan | Explicit scope boundary. |
| D-003 | Billing and payments are out of scope for v1. | Kickoff transcript excerpt | 2026-05-15 | Mira | Mira explicitly excluded billing and payments from v1. |
| D-004 | Linear is acceptable for delivery tracking. | Kickoff transcript excerpt | 2026-05-15 | Mira | Execution tracking can happen in Linear. |
| D-005 | GitHub is where code review happens. | Kickoff transcript excerpt | 2026-05-15 | Mira | PR workflow should reference requirements and verification evidence. |
| D-006 | Mira reviews requirements before tickets are finalized. | Kickoff transcript excerpt | 2026-05-15 | Mira | Review gate before execution tickets are finalized. |

## Candidate decisions

| ID | Candidate decision | Source | Date | Needs confirmation from | Notes |
|---|---|---|---|---|---|
| C-001 | Calls, follow-up emails, and Linear issue comments can serve as decision source locations for now. | Kickoff transcript excerpt | 2026-05-15 | Jordan / Mira | Alex proposed this; Jordan said “That works.” Candidate only because the project still lacks a canonical decision location. |

## Deferred / rejected decisions

| ID | Status | Item | Source | Date | Notes |
|---|---|---|---|---|---|
| X-001 | Deferred | Whether customers receive email notifications in v1. | Kickoff transcript excerpt | 2026-05-15 | Mira said “Probably,” but not to decide today. |
| X-002 | Deferred | Document upload acceptance details: file types, size limits, and storage location. | Kickoff transcript excerpt | 2026-05-15 | Mira needs to think through the details. |
| X-003 | Rejected | Full CRM rebuild in v1. | Kickoff transcript excerpt | 2026-05-15 | Captured as accepted non-goal in D-002. |
| X-004 | Rejected | Billing and payments in v1. | Kickoff transcript excerpt | 2026-05-15 | Captured as accepted non-goal in D-003. |

## Open questions

| ID | Question | Source | Owner | Status | Notes |
|---|---|---|---|---|---|
| Q-001 | Should customers receive email notifications in v1? | Kickoff transcript excerpt | Mira / Jordan | Open | Mentioned as likely but not decided. |
| Q-002 | Where should final decision notes live? | Kickoff transcript excerpt | Jordan / Mira | Open | Current answer is source locations only; no formal decision log exists yet. |
| Q-003 | What counts as acceptance for document upload? | Kickoff transcript excerpt | Mira | Open | Needs file type, size, and storage decisions. |

## Change log

| Date | Change | Source |
|---|---|---|
| 2026-05-15 | Created example decision record from fake transcript excerpt. | `examples/basic-client-project/transcript-excerpt.md` |
