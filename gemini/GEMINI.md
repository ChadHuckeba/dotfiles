# SurvivalStack | Global Instructions & Corporate Standards (v2.1 - April 2026)

## 1. GitHub Project & Issue Governance

### 1.1 Project Tracking & Management
- **Mandate**: SurvivalStack uses GitHub Projects to maintain high-level awareness.
- **Workflow**: 
  - At the start of every session, verify the active Project ID. 
  - **Memory Persistence**: Use `save_memory(scope='project')` to store the Project ID once identified.
  - Maintain real-time synchronization of project item status (Todo -> In Progress -> Done).

#### 1.1.1 Memory Schema
- **Two-Store Architecture**: 
  - **Dynamic Session State**: Governed by the JSON schema below, written via `save_memory(scope='project')`.
  - **Static Registry Data**: Lives in `gemini/registry.json`. Read from file, NOT from memory. Do not duplicate registry data into session memory.
- **Mandate**: All dynamic data saved via `save_memory(scope='project')` MUST conform to the standard schema formatted as a strict JSON block.
- **Rules**:
  - Do not inject arbitrary keys; propose a schema update first if new data points are required.
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

### 1.5 Repository Initialization Protocol
- **Trigger**: Whenever the AI is instructed to create a new repository on GitHub.
- **Protocol (if/then/else)**:
  - **Consult**: I MUST ask: "Should I also provision a standardized Project Board from the Master Template?"
  - **If YES**:
    1. Create the repository.
    2. Synchronize labels: Fetch `standard_labels` from `gemini/registry.json` and apply them to the new repository using the `gh` CLI.
    3. Resolve the Master Template Project ID from `gemini/registry.json`.
    4. Execute `gh project copy <ID> --owner ChadHuckeba --title "<Repo Name>"` to create the standardized board (ensuring the Project Board name matches the Repository name exactly).
    5. Link the project board to the new repository.
    6. Record the new repository and its assigned Project Board ID in the `repositories` key of `gemini/registry.json`.
    7. Fetch any unique Field/Option IDs and update `gemini/registry.json` (requires user approval per **Section 5**).
  - **If NO**: 
    1. Create the repository only.
    2. Synchronize labels: Fetch `standard_labels` from `gemini/registry.json` and apply them to the new repository using the `gh` CLI.
    3. Record the repository in `gemini/registry.json` under `repositories` with `project_board_id: null`.

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
- **No-Test-Suite Fallback**: If no test suite exists, I must:
  1. Document that fact explicitly.
  2. State what manual verification was performed instead.
  3. Request explicit user confirmation before closing or merging.

## 4. Code Review & Approval

### 4.1 Pre-Commit Review
- **Mandate**: Before executing `git commit` or merging any Pull Request, I must present a concise summary or diff of the changes to the user.
- **Approval**: I must explicitly wait for user approval (e.g., "LGTM", "yes", "approved") or feedback before finalizing the commit.
- **Iterative Refinement**: If feedback is provided, I will adjust the implementation and re-submit the changes for another review round.

## 5. Memory Architecture

### 5.1 Two-Store Design
- **Static Registry (`gemini/registry.json`)**:
  - Contains static reference data (Field IDs, Option IDs, Master Template ID).
  - **ID Formats**: 
    - **Integer IDs** (e.g., `9`): Used by the `gh` CLI for commands like `gh project copy`.
    - **Node IDs** (e.g., `PVT_...`, `PVTSSF_...`): Used by the GitHub GraphQL API.
    - **Rule**: Never use a Node ID where an Integer ID is expected (and vice versa).
  - Source of truth for all GitHub Project configurations.
  - **Read-Mostly**: Changes require explicit user approval.
- **Session Memory (`save_memory(scope='project')`)**:
- Dynamic runtime state only (Branch, Issues, Session Summaries).
- Governed by the schema in **Section 1.1.1**.
- **Rule**: Never write static registry data here.

## 6. Engineering Safety Protocols

### 6.1 Atomic Edits
- **Mandate**: Never use `write_file` for existing files >100 lines. 
- **Workflow**: Use surgical `replace` calls and verify via targeted `read_file` of the modified section immediately after the edit.

### 6.2 Pre-flight Checks
- **Mandate**: Perform syntax validation before finalizing a task.
- **Workflow**: Run language-appropriate syntax checks (e.g., `python -m py_compile [file]` or `tsc --noEmit`) after modification but before declaring a task complete.

### 6.3 Context Resync
- **Mandate**: If a `replace` or `write_file` fails due to a line-number mismatch, I must perform a fresh `read_file` of the target section to re-align my internal buffer before retrying.

