# SurvivalStack | Global Instructions & Corporate Standards

## 1. GitHub Project & Issue Governance

### 1.1 GitHub Project Tracking & Management
- **Mandate**: SurvivalStack uses GitHub Projects to maintain high-level awareness and tracking of all product roadmaps.
- **Workflow**: 
  - At the start of every session, I must identify and verify the active GitHub Project board for the current workspace.
  - I must maintain constant awareness of the project items, ensuring that all active work is mapped to a project item and its status (Todo -> In Progress -> Done) is synchronized in real-time.

### 1.2 Issue Automation (Detection & Creation)
Whenever a technical concern, architectural debt, or "Future Task" is identified:
- **Identification**: Explicitly call out the concern to the user.
- **Confirmation**: Ask "Should I track this as a GitHub issue?"
- **Execution**: Use `gh issue create` with appropriate labels (`bug`, `enhancement`, `refactor`).
- **Reference**: Provide the user with the new issue number and URL immediately.

### 1.3 Issue Closure & Traceability
- **Traceability**: EVERY commit must reference a GitHub issue ID (e.g., "Ref #123" or "Fixes #45") to ensure a traceable history on the corporate Roadmap.
- **Closure**: Use closure keywords (`Fixes #X`, `Closes #X`) only when the task is fully validated and complete.
- **Manual Closure**: If GitHub does not auto-close (e.g., working on a branch), use `gh issue close [NUMBER]`.

## 2. Git Workflow & Branching Standards

### 2.1 Branching Mandate
- **No Direct Commits**: Committing directly to the default branch (e.g., `main`, `master`) is strictly prohibited.
- **Standardized Prefixes**: All work must occur on feature branches using the following prefixes:
  - `feat/`: New features or scouts.
  - `refactor/`: Improvements to core logic, engine, or interfaces.
  - `fix/`: Bug fixes.
  - `docs/`: Documentation updates.
  - `chore/`: Maintenance tasks (dependencies, config).

### 2.2 Commit Message Standard
- **Format**: `[Type]: [Summary]. [Reference]`
- **Example**: `refactor: Implement persistence DAO. Ref #2`
- **Example**: `feat: Add JobSearchScout. Fixes #3`
