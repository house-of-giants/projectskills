# Basic Client Project Example

This is a fake example showing how `project-context` turns a meeting transcript excerpt into a reusable `.agents/projectskills/project-context.md` scaffold.

Files:

- `transcript-excerpt.md` — fake source transcript excerpt
- `project-context.md` — expected output shape
- `decisions.md` — expected decision-capture output shape

The example is intentionally small, but it mirrors a common real workflow:

1. Full meeting transcripts or meeting-summary artifacts exist outside the production repo.
2. `project-context` records where those transcripts live, but does not ingest the whole transcript corpus by default.
3. A project workspace gets a compact `.agents/projectskills/project-context.md` file with source locations and operating rules, not a dumped transcript.
4. Later, `decision-capture` can selectively read a transcript when the user asks for decision extraction.

The key point: teams do not need to keep formal decision logs inside their app repository. Project Skills should adapt to wherever source truth already lives — transcripts, email, Linear/Jira, GitHub, docs, CRM notes, or a lightweight project folder.

One useful local shape:

```text
~/Work/client-portal/
  .agents/projectskills/project-context.md
  transcripts/2026-05-15-kickoff.md
  app/                 # production git repo
```

The production repo can stay focused on production code. The project workspace can hold the context layer around it.

This example includes a short transcript excerpt only so the expected output is easy to understand. In a real project, the context skill should usually point to full transcripts first, then read them only when a transcript-specific task requires it.
