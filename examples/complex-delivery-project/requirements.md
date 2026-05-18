# Requirements

Status: active example
Last updated: 2026-05-18
Scope: FieldOps Offline v1 inspection/export workflow

## Requirement sources

| Source | Type | Date | Location | Notes |
|---|---|---|---|---|
| Project Context | Project operating context | 2026-05-18 | `project-context.md` | Read first. |
| Decisions | Decision capture | 2026-05-18 | `decisions.md` | Primary source. |
| Decision Log | Canonical accepted decisions | Current live doc in fake project | `ops/decision-log.md` | Accepted DL-* refs. |
| Tracker | Execution tracker | Current live tracker in fake project | `TRACKER-PROJECT-FIELDOPS` | Issue statuses must be verified before claims. |

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
| REQ-001 | DL-001 | Field inspector | The app must allow inspectors to create and edit inspection notes fully offline. | Inspector can open a draft route without network; add/edit checklist notes; close/reopen app; notes persist locally. | No network dependency during field capture; no sync service requirement. | Mira / Jordan | FO-12 if still current; verify in tracker | TBD | Requirement ready |
| REQ-002 | DL-002; X-001 | Field inspector | The app must attach photos to checklist items rather than only to the route. | Inspector can add photos to a checklist item; photos remain associated with that item after save/load; route-level-only attachment is not the primary model. | Do not build route-level-only photo behavior. | Mira | FO-18 if still current; verify in tracker | TBD | Requirement ready |
| REQ-003 | DL-003 | Field operations lead | The app must create draft routes from imported CSV route plans. | User can import a valid route CSV; route items appear in the inspection workflow; invalid rows produce reviewable errors. | No live scheduling integration in v1. | Mira / Jordan | FO-09 if still current; verify in tracker | TBD | Requirement ready |
| REQ-004 | DL-004; DL-005; DL-008 | Operations reviewer | The app must export an inspection package containing inspection JSON, photos, and a review manifest with stable IDs and portable filenames. | Export creates a package folder; JSON references stable inspection/checklist IDs; photos are included; manifest references exported artifacts; generated filenames avoid spaces and reserved characters. | No real-time cloud sync; no unapproved filename personalization. | Jordan | FO-22 if still current; verify in tracker | TBD | Requirement ready |
| REQ-005 | DL-007 | Client reviewer | The v1 demo path must prioritize offline capture and export over dashboard polish. | Demo path shows route import, offline note/photo capture, save/load, and export package creation; dashboard polish does not block demo if core path works. | Do not treat dashboard analytics polish as higher priority than capture/export. | Jordan / Mira | FO-30 if still current; verify in tracker | TBD | Requirement ready |

## Proposed requirements from candidates

These are useful candidate-derived drafts, not accepted requirements. Promote only after the project-defined reviewer confirms them or a canonical decision source is updated.

| ID | Source candidate / question | Proposed requirement | Needed confirmation | Affected committed requirement |
|---|---|---|---|---|
| PREQ-001 | C-001; Q-001 | Photo metadata appears in a collapsed checklist-item detail section with the approved required fields. | Confirm required metadata fields and UX treatment. | REQ-002 / REQ-004 |
| PREQ-002 | C-002 | The first approved image formats are `jpg`, `png`, and `heic`. | Confirm approved image formats. | REQ-002 / REQ-004 |
| PREQ-003 | C-003 | Export filenames include inspector initials. | Confirm privacy and filename constraints before promotion. | REQ-004 |

## Non-goals and constraints

| ID | Type | Item | Source decision refs | Notes |
|---|---|---|---|---|
| CON-001 | Constraint | Offline capture is core v1 behavior. | DL-001 | Do not require network access for field capture. |
| CON-002 | Constraint | Export package is v1 handoff artifact. | DL-004 | Sync is future scope. |
| CON-003 | Constraint | Generated filenames must be portable across macOS, Windows, and Linux. | DL-008 | Avoid spaces/reserved characters. |
| NG-001 | Non-goal / superseded | Route-level-only photo attachment. | DL-002; X-001 | Checklist-item association is current. |
| NG-002 | Non-goal / deferred | Real-time cloud sync. | DL-006; X-002 | Future phase/change order. |
| NG-003 | Non-goal / deferred | Dashboard analytics polish as demo blocker. | DL-007; X-003 | Does not outrank capture/export path. |

## Review and execution rules

| ID | Rule | Source decision refs | Applies to | Notes |
|---|---|---|---|---|
| RULE-001 | PRs/issues should cite relevant requirement IDs and DL-* refs. | Project context | REQ-001 through REQ-005 | Keeps traceability intact. |
| RULE-002 | Tracker Done, merged PRs, and green checks are not client acceptance. | Q-003 | All acceptance claims | Requires demo/review or written acceptance evidence. |
| RULE-003 | Candidate-derived PREQ-* items are not committed scope until promoted. | C-001 through C-003 | PREQ-* | Use as proposed details only. |

## Open requirement questions

| ID | Source question | Question | Blocks / affects | Owner | Status |
|---|---|---|---|---|---|
| RQ-001 | Q-001 | Which photo metadata fields are required for acceptance? | PREQ-001; REQ-002 / REQ-004 details | Mira | Open |
| RQ-002 | Q-002 | Which export fixture set is final and approved? | REQ-004 verification | Jordan / Mira | Open |
| RQ-003 | Q-003 | What evidence establishes milestone acceptance beyond demo readiness? | REQ-001 through REQ-005 acceptance | Jordan | Open |

## Change log

| Date | Change | Source |
|---|---|---|
| 2026-05-18 | Created public-safe complex delivery requirements. | `decisions.md` |
