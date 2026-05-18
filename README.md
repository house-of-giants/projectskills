# Project Skills for AI Agents

[![Skills](https://skills.sh/b/house-of-giants/projectskills)](https://skills.sh/house-of-giants/projectskills)

Install with `npx skills add house-of-giants/projectskills`.

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

`project-context` is the foundation. It creates `.agents/project-context.md`, a lightweight project context file that every other skill reads before acting.

That file does not have to live inside a production code repo. For many teams, the better shape is a project workspace with one or more repos inside it:

```text
~/Work/client-portal/
  .agents/project-context.md
  transcripts/
  notes/
  app/                 # git repo
  docs/                # optional docs repo or loose project docs
```

Use whatever workspace shape matches how the project actually runs. The context file should point to source systems and code locations without forcing teams to commit transcripts or formal decision logs into app repos.

Project Skills use simple top-level `.agents/*.md` context files, matching the convention used by adjacent skill collections. Keep the set small and clearly named rather than adding a deep namespace.

```text
                    workspace-init
             (scaffold workspace once)
                         │
                         ▼
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
| [workspace-init](skills/workspace-init/) | v0.1 draft | Scaffold a parent project workspace with `.agents/`, `ops/`, `scratch/`, `AGENTS.md`, `CLAUDE.md`, and safe ignore rules before project context exists. |
| [project-context](skills/project-context/) | v0.1 draft | Create and maintain `.agents/project-context.md`, the project-level context all other skills read first. |
| [decision-capture](skills/decision-capture/) | v0.1 draft | Extract accepted, candidate, deferred, and rejected decisions from transcripts, docs, emails, issues, and notes. |
| [requirements-from-decisions](skills/requirements-from-decisions/) | v0.1 draft | Turn accepted decisions into functional requirements with acceptance criteria, non-goals, and source refs. |
| [execution-trace](skills/execution-trace/) | v0.1 draft | Link requirements to tickets, PRs, commits, releases, and verification evidence without overstating completion. |

## Installation

Install with the open `skills` CLI:

```bash
npx skills add house-of-giants/projectskills
```

List available Project Skills without installing:

```bash
npx skills add house-of-giants/projectskills --list
```

Install all Project Skills for Claude Code and Codex:

```bash
npx skills add house-of-giants/projectskills --skill '*' -a claude-code -a codex
```

Install one skill:

```bash
npx skills add house-of-giants/projectskills --skill project-context
```

Install globally:

```bash
npx skills add house-of-giants/projectskills --skill '*' -g
```

### Manual install

If you do not want to use the CLI, clone and copy the skills into your project:

```bash
git clone https://github.com/house-of-giants/projectskills.git
mkdir -p .agents/skills
cp -r projectskills/skills/* .agents/skills/
```

Or keep the collection as a project-local vendor dependency:

```bash
git submodule add https://github.com/house-of-giants/projectskills.git .agents/vendor/projectskills
```

Then point your agent at `.agents/vendor/projectskills/skills/` or copy selected skills into your agent's skill directory.

## Quick start

After installing into a new parent workspace that only has an app/repo folder, initialize the workspace first:

```text
Use the workspace-init skill to scaffold this parent project workspace. Do not move the existing repo folder.
```

Then ask your agent:

```text
Use the project-context skill to create project context for this project workspace.
```

Or, if you already know where source material lives:

```text
Use project-context to create .agents/project-context.md for this workspace. Record where transcripts, tickets, docs, and repos live, but do not ingest full transcripts yet.
```

See `examples/basic-client-project/` for a small fake example and `examples/complex-delivery-project/` for a fuller traceability example with candidates, blockers, scope guards, and unaccepted implementation evidence.

To extract decisions from a named source:

```text
Use decision-capture on this transcript excerpt and update .agents/decisions.md. Keep accepted decisions separate from candidates and open questions.
```

To draft requirements from accepted decisions:

```text
Use requirements-from-decisions to create .agents/requirements.md from .agents/decisions.md. Use accepted decisions only by default and keep candidates/open questions separate.
```

To trace delivery evidence:

```text
Use execution-trace to create .agents/execution-trace.md from .agents/requirements.md. Link tickets, PRs, commits, checks, and review evidence without claiming completion unless evidence exists.
```

## Structured markdown, not another app

Project Skills use predictable markdown sections, tables, IDs, statuses, and source links so agents can read and update project context without introducing a new project management system.

The goal is simple: keep decisions, requirements, actions, and execution evidence formatted consistently enough to move between agents and tools.

## Skill evals

Each draft skill can include tiny behavior checks under `skills/<skill-name>/evals/evals.json`.

The evals are not a heavyweight test harness yet. They document the behavior the skill must preserve, such as not ingesting full transcripts by default, keeping accepted decisions separate from candidates, and preserving source refs.

## Contributing

This project is early. Skill requests, examples, and workflow feedback are welcome once the repo is public.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the skill format and contribution guidelines.

## License

MIT. See [LICENSE](LICENSE).
