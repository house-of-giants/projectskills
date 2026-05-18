# Decisions

Status: active example
Last updated: 2026-05-18
Scope: FieldOps Offline v1 inspection/export workflow

## Decision sources

| Source | Type | Date | Location | Notes |
|---|---|---|---|---|
| Project Context | Project operating context | 2026-05-18 | `project-context.md` | Read first. |
| Decision Log | Canonical accepted decisions | See source | `ops/decision-log.md` | Fake canonical source for accepted DL-* decisions. |
| Scope brief | Scope cutline | Local snapshot updated 2026-05-10 | `ops/scope-brief.md` | Older language may be superseded by DL decisions. |
| Review packet | Meeting-derived candidates | 2026-05-12 | `ops/meeting-packets/2026-05-12-review.md` | Candidate UX/source details only unless accepted. |

## Accepted decisions

| ID | Decision | Source | Date | Owner / approver | Notes |
|---|---|---|---|---|---|
| DL-001 | Field inspectors must be able to create and edit inspection notes fully offline. | Decision Log | See canonical source; local index updated 2026-05-10 | Decision Log | Network-dependent capture is not acceptable for v1 field work. |
| DL-002 | Inspection photos attach to checklist items, not to the route as a whole. | Decision Log | See canonical source; local index updated 2026-05-10 | Decision Log | Supersedes old route-level photo language. |
| DL-003 | Draft routes are prepared locally from imported CSV route plans. | Decision Log | See canonical source; local index updated 2026-05-10 | Decision Log | v1 does not include live scheduling integration. |
| DL-004 | Export package is the v1 handoff artifact. | Decision Log | See canonical source; local index updated 2026-05-10 | Decision Log | Exported folder contains JSON, photos, and review manifest. |
| DL-005 | Review manifest uses stable inspection IDs and checklist item IDs. | Decision Log | See canonical source; local index updated 2026-05-10 | Decision Log | Required for downstream operations review. |
| DL-006 | Real-time cloud sync is out of v1. | Decision Log | See canonical source; local index updated 2026-05-10 | Decision Log | Treat sync as future phase/change order. |
| DL-007 | The v1 demo prioritizes offline capture and export over visual dashboard polish. | Review packet; appended to Decision Log | 2026-05-12 | Alex Rivera; canonical Decision Log | Demo priority order for the first reviewer build. |
| DL-008 | Export filenames must be safe across macOS, Windows, and Linux. | Review packet; appended to Decision Log | 2026-05-12 | Alex Rivera; canonical Decision Log | Avoid spaces and reserved characters in generated artifacts. |

## Candidate decisions

| ID | Candidate decision | Source | Date | Needs confirmation from | Notes |
|---|---|---|---|---|---|
| C-001 | Show photo metadata as a collapsed section beneath the checklist item editor. | Review packet | 2026-05-12 | Mira / Alex | Useful UX direction, not in accepted Decision Log. |
| C-002 | Use `jpg`, `png`, and `heic` as the first approved image formats. | Review packet | 2026-05-12 | Mira / Jordan | Needs explicit source approval. |
| C-003 | Include inspector initials in exported filenames. | Review packet | 2026-05-12 | Alex / Jordan | May conflict with privacy or filename constraints. |

## Deferred / rejected decisions

| ID | Status | Item | Source | Date | Notes |
|---|---|---|---|---|---|
| X-001 | Superseded | Route-level photo attachment is replaced by checklist-item photo attachment. | DL-002 | See canonical source | Do not build route-level-only photo behavior. |
| X-002 | Deferred | Real-time cloud sync. | DL-006 | See canonical source | Future phase/change order. |
| X-003 | Deferred | Dashboard analytics polish. | DL-007 | 2026-05-12 | Does not outrank offline capture/export for v1 demo. |

## Open questions

| ID | Question | Source | Owner | Status | Notes |
|---|---|---|---|---|---|
| Q-001 | Which photo metadata fields are required for acceptance? | Review packet | Mira | Open | Affects photo detail UX and manifest requirements. |
| Q-002 | Which export fixture set is final and approved? | Review packet | Jordan / Mira | Open | Affects final verification. |
| Q-003 | What evidence establishes milestone acceptance beyond demo readiness? | Project context | Jordan | Open | Prevents merged PRs from becoming acceptance claims. |

## Change log

| Date | Change | Source |
|---|---|---|
| 2026-05-18 | Created public-safe complex delivery decision set. | Fake sources |
