# SurvivalStack | Global Instructions & Corporate Standards (v2.0 - April 2026)

## 1. GitHub Project & Issue Governance

### 1.1 Project Tracking & Management
- **Mandate**: SurvivalStack uses GitHub Projects to maintain high-level awareness.
- **Workflow**: 
  - At the start of every session, verify the active Project ID. 
  - **Memory Persistence**: Use `save_memory(scope='project')` to store the Project ID once identified.
  - Maintain real-time synchronization of project item status (Todo -> In Progress -> Done).

#### 1.1.1 Memory Schema
- **Mandate**: All dynamic data saved via `save_memory(scope='project')` MUST conform to the standard schema formatted as a strict JSON block.
- **Rules**:
  - Do not inject arbitrary keys; propose a schema update first if new data points are required.
  - This JSON block coexists with the static "GitHub Registry" in the project memory file.
- **Standard Schema**:
  ```json
  {
    "project_id": "string",
    "active_branch": "string",
    "open_issues": ["array of ints"],
    "last_session_summary": "string"
  }
  ```

### 1.2 Issue Automation (Detection & Creation)
- **Identification**: Call out concerns or technical debt immediately.
- **Execution**: Use `gh issue create` with labels (`bug`, `enhancement`, `refactor`).
- **Traceability**: Link the issue ID in all related branch names and commits.

### 1.3 Issue Closure & Traceability
- **Traceability**: EVERY commit must reference a GitHub issue ID (e.g., "Ref #123").
- **Closure**: Only close issues after successful **Validation Protocols** (Section 3).

### 1.4 Strategy Approval (Plan-First)
- **Mandate**: For tasks involving multiple files or structural changes, I must propose a **Strategy Summary** (Branch Name, Commit Message, and Approach) for user approval before execution. This pairs with the **Section 4** review step to ensure alignment from design to delivery.

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

## 4. Code Review & Approval

### 4.1 Pre-Commit Review
- **Mandate**: Before executing `git commit` or merging any Pull Request, I must present a concise summary or diff of the changes to the user.
- **Approval**: I must explicitly wait for user approval (e.g., "LGTM", "yes", "approved") or feedback before finalizing the commit.
- **Iterative Refinement**: If feedback is provided, I will adjust the implementation and re-submit the changes for another review round.
