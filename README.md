# Project Skills for AI Agents

A collection of AI agent skills for keeping project context intact from meeting notes to requirements, tickets, pull requests, and delivery closeout.

Built by [House of Giants](https://houseofgiants.com), a product engineering studio using these patterns in real client work.

## What are Project Skills?

Project Skills are installable markdown skills that teach AI agents how to preserve project context across the delivery lifecycle.

Most coding agents are good at helping with a local task. The harder problem is keeping the chain intact:

```text
meeting notes
  ↓
decisions
  ↓
requirements
  ↓
tickets / PRs
  ↓
execution trace
  ↓
delivery closeout
```

Project Skills are not a project management app, memory product, or autonomous agent framework. They are small, practical workflows your agent can use inside the tools you already have.

## How the skills work together

`project-context` is the foundation. It creates `.agents/projectskills/project-context.md`, a lightweight project context file that every other skill reads before acting.

That file does not have to live inside a production code repo. For many teams, the better shape is a project workspace with one or more repos inside it:

```text
~/Work/client-portal/
  .agents/projectskills/project-context.md
  transcripts/
  notes/
  app/                 # git repo
  docs/                # optional docs repo or loose project docs
```

Use whatever workspace shape matches how the project actually runs. The context file should point to source systems and code locations without forcing teams to commit transcripts or formal decision logs into app repos.

Generated Project Skills artifacts live under `.agents/projectskills/` so they do not pollute the top-level `.agents` folder or collide with other agent tools.

```text
                    project-context
              (read by all skills first)
                         │
      ┌──────────────────┼──────────────────┐
      ▼                  ▼                  ▼
decision-capture  requirements-from-   execution-trace
                       decisions
      │                  │                  │
      └──────────────────┴──────────────────┘
                         ▼
                  delivery-closeout
```

## Available skills

| Skill | Status | Description |
|---|---:|---|
| [project-context](skills/project-context/) | v0.1 draft | Create and maintain `.agents/projectskills/project-context.md`, the project-level context all other skills read first. |
| [decision-capture](skills/decision-capture/) | v0.1 draft | Extract accepted, candidate, deferred, and rejected decisions from transcripts, docs, emails, issues, and notes. |
| requirements-from-decisions | planned | Turn accepted decisions into functional requirements with acceptance criteria, non-goals, and source refs. |
| execution-trace | planned | Link requirements to tickets, PRs, commits, releases, and verification evidence. |

## Installation

This repo is private while the first skills are being shaped.

### Option 1: Clone and copy

```bash
git clone https://github.com/house-of-giants/projectskills.git
mkdir -p .agents/skills/projectskills
cp -r projectskills/skills/* .agents/skills/projectskills/
```

### Option 2: Git submodule

```bash
git submodule add https://github.com/house-of-giants/projectskills.git .agents/skills/projectskills
```

Then point your agent at `.agents/skills/projectskills/skills/` or copy selected skills into your agent's skill directory.

### Future install paths

Planned after v0.1:

```bash
npx skills add house-of-giants/projectskills
npx skillkit install house-of-giants/projectskills
```

Claude Code plugin support is planned once the initial skill set stabilizes.

## Quick start

After installing, ask your agent:

```text
Use the project-context skill to create project context for this project workspace.
```

Or, if you already know where source material lives:

```text
Use project-context to create .agents/projectskills/project-context.md for this workspace. Record where transcripts, tickets, docs, and repos live, but do not ingest full transcripts yet.
```

See `examples/basic-client-project/` for a small fake example.

To extract decisions from a named source:

```text
Use decision-capture on this transcript excerpt and update .agents/projectskills/decisions.md. Keep accepted decisions separate from candidates and open questions.
```

## Structured markdown, not another app

Project Skills use predictable markdown sections, tables, IDs, statuses, and source links so agents can read and update project context without introducing a new project management system.

The goal is simple: keep decisions, requirements, actions, and execution evidence formatted consistently enough to move between agents and tools.

## Contributing

This project is early. Skill requests, examples, and workflow feedback are welcome once the repo is public.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the skill format and contribution guidelines.

## License

MIT. See [LICENSE](LICENSE).
