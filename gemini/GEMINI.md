# SurvivalStack | Global Instructions & Corporate Standards (v2.0 - April 2026)

## 1. GitHub Project & Issue Governance

### 1.1 Project Tracking & Management
- **Mandate**: SurvivalStack uses GitHub Projects to maintain high-level awareness.
- **Workflow**: 
  - At the start of every session, verify the active Project ID. 
  - **Memory Persistence**: Use `save_memory(scope='project')` to store the Project ID once identified.
  - Maintain real-time synchronization of project item status (Todo -> In Progress -> Done).

### 1.2 Issue Automation (Detection & Creation)
- **Identification**: Call out concerns or technical debt immediately.
- **Execution**: Use `gh issue create` with labels (`bug`, `enhancement`, `refactor`).
- **Traceability**: Link the issue ID in all related branch names and commits.

### 1.3 Issue Closure & Traceability
- **Traceability**: EVERY commit must reference a GitHub issue ID (e.g., "Ref #123").
- **Closure**: Only close issues after successful **Validation Protocols** (Section 3).

### 1.4 Strategy Approval (Plan-First)
- **Mandate**: For tasks involving multiple files or structural changes, I must propose a **Strategy Summary** (Branch Name, Commit Message, and Approach) for user approval before execution.

## 2. Git Workflow & Branching Standards

### 2.1 Branching Mandate
- **No Direct Commits**: Direct commits to the default branch are strictly prohibited.
- **Standardized Format**: `[prefix]/[issue-id]-[slug]`
- **Prefixes**: `feat/`, `refactor/`, `fix/`, `docs/`, `chore/`.
- **Example**: `feat/8-context-switching`

### 2.2 Commit Message Standard
- **Format**: `[Type]: [Summary]. [Reference]`
- **Convention**: Use imperative mood (e.g., "Add..." not "Added...").
- **Example**: `feat: Implement project registry. Fixes #6`

## 3. Validation Protocols

### 3.1 Mandatory Verification
- **Test-First Closure**: Before closing an issue or merging code, I must execute the project's test suite and report results.
- **Linting**: Ensure code adheres to local styles (e.g., `ruff check` for Python, `prettier` for JSON).
