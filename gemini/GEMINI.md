# SurvivalStack | Global Instructions
## GitHub Issue Automation Workflow

Whenever a technical concern, architectural debt, or "Future Task" is identified during a session, follow this workflow to automate its documentation:

### 1. Detection & Identification
- Explicitly call out the concern to the user.
- Ask: "Should I track this as a GitHub issue?"

### 2. Information Gathering
- If confirmed, gather the following details:
  - **Title**: A punchy, descriptive title (e.g., "Refactor: Modularize project registry").
  - **Body**: A structured description including "Problem," "Proposed Solution," and "Impact."
  - **Labels**: Identify appropriate labels (e.g., `bug`, `enhancement`, `security`).

### 3. Execution (via GitHub CLI)
- Use the `gh` tool to create the issue.
- **Command Template**:
  ```bash
  gh issue create --title "[TITLE]" --body "[BODY]" --label "[LABEL]"
  ```
- **Constraint**: If `gh` is not installed or authenticated, provide the user with the exact text for the Title and Body so they can create it manually, and advise them to install the GitHub CLI for future automation.

### 4. Verification
- Confirm the issue number and URL once created.
- Update the local `README.md` or code comments if necessary to reference the new issue.

## GitHub Issue Closure Workflow
Whenever a task is completed that addresses an open GitHub issue:

### 1. Verification
- Use `gh issue list` to confirm the exact issue number.
- Ensure all requirements in the issue body have been met.

### 2. Committing with Linkage
- When proposing a commit message, **ALWAYS** include a closure keyword at the end.
- **Format**: "[Type]: [Summary]. Fixes #[Number]"
- **Example**: "Refactor: Implement hybrid registry sync. Fixes #1"

### 3. Pushing & Closing
- Once the commit is pushed to the default branch (main), confirm that GitHub has automatically closed the issue.
- If it hasn't closed (e.g., if working on a branch), manually close it using:
  ```bash
  gh issue close [NUMBER] --comment "Resolved via [COMMIT_HASH]"
  ```
