# Project Context

Status: active example
Last updated: 2026-05-15

## Project overview

Fake client portal project for customer support request intake and account document upload.

The first milestone should prove one intake path for support requests and basic document upload. The project should not expand into a full CRM rebuild.

## Stakeholders and roles

| Person | Role | Notes |
|---|---|---|
| Jordan | Client founder / final approver | Confirms milestone direction and scope boundaries. |
| Mira | Operations lead / day-to-day reviewer | Reviews requirements before tickets are finalized. |
| Alex | Delivery engineering lead | Turns accepted direction into requirements, tickets, and PRs. |

## Source systems

| System | Role | Link / location | Notes |
|---|---|---|---|
| Meeting transcripts | Primary discussion source | External transcript tool / export location TBD | Full transcripts are not committed to the production repo. |
| Follow-up email | Decision confirmation source | Client email thread TBD | Some final decisions may be confirmed after calls. |
| Linear | Execution tracker | Workspace/project TBD | Tickets should map to accepted requirements. Issue comments may also capture delivery decisions. |
| GitHub | Code / PR review | Repository TBD | PRs should reference requirements and verification evidence. |

## Decision log

| Status | Location | Notes |
|---|---|---|
| TBD | No formal decision log yet | Current source locations are meeting transcripts, follow-up emails, and Linear issue comments. Do not assume decisions live in the repo unless the project chooses that. |

## Requirement format

Requirements should be written in structured markdown with:

| Field | Expected content |
|---|---|
| Requirement ID | Stable short ID, if the project uses IDs. |
| Source | Link or pointer to transcript, email, doc, issue, or approved summary. |
| User / actor | Who needs the behavior. |
| Requirement | What must be true. |
| Acceptance criteria | Observable checks for completion. |
| Non-goals | Explicit exclusions. |
| Reviewer | Person or role that accepts the requirement. |
| Execution target | Linear issue, GitHub PR, or other tracker link when available. |

## Execution tracker

| Tracker | Status | Notes |
|---|---|---|
| Linear | Active | Used for delivery tracking. Tickets should reference accepted requirements when available. |

## Repository / PR workflow

| System | Rule |
|---|---|
| GitHub | PRs should reference the requirement they satisfy and any remaining verification gaps. |
| GitHub | PRs should not claim client acceptance unless Mira or Jordan has reviewed the relevant milestone or requirement. |

## Review and approval rules

| Area | Reviewer / approver | Rule |
|---|---|---|
| Requirements | Mira | Reviews requirements before tickets are finalized. |
| Milestone direction | Jordan | Provides final approval for milestone direction and major scope calls. |
| Scope expansion | Jordan + Mira | Billing, payments, and CRM-rebuild work are not in v1 unless explicitly revisited. |

## Delivery closeout expectations

For each shipped milestone, record:

| Field | Notes |
|---|---|
| Shipped | What changed for users/operators. |
| Requirements satisfied | Link or list requirement IDs. |
| Execution evidence | Linked Linear issues, GitHub PRs, commits, checks, screenshots, or demo notes. |
| Deferred / open | What remains open, blocked, or intentionally out of scope. |
| Client review | Who reviewed and what was accepted. |

## Constraints and non-goals

| Type | Item | Status | Source |
|---|---|---|---|
| Constraint | First milestone is limited to request intake and document upload. | Accepted | Transcript excerpt, 2026-05-15 |
| Non-goal | Do not rebuild the full CRM in v1. | Accepted | Transcript excerpt, 2026-05-15 |
| Non-goal | Billing and payments are out of scope for v1. | Accepted | Transcript excerpt, 2026-05-15 |

## Project vocabulary

| Term | Meaning |
|---|---|
| Customer portal | Lightweight customer-facing portal for support requests and account documents. |
| Support request intake | A single path for customers to submit support needs. |
| Account documents | Customer documents uploaded through the portal. |
| Document upload | v1 capability for customers to upload files; acceptance details are TBD. |

## Open questions

| Question | Status | Source / owner |
|---|---|---|
| Should customers get email notifications in v1? | Open | Transcript excerpt, Mira/Jordan |
| Where should final decision notes live? | Open | Transcript excerpt; current answer is source locations only. |
| What counts as acceptance for document upload? | Open | Transcript excerpt, Mira |
| What file types, size limits, and storage location should document upload support? | Open | Transcript excerpt, Mira |

## Change log

| Date | Change | Source |
|---|---|---|
| 2026-05-15 | Created from fake transcript excerpt. | `examples/basic-client-project/transcript-excerpt.md` |
