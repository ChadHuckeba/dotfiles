# SurvivalStack | Dotfiles
Personal configuration files and automated workflows for my development environment.

## 📁 Repository Structure

### ♊ Gemini CLI (`gemini/`)
Contains global instructions, service registries, and operational workflows.
- **GEMINI.md**: Global "laws" and core engineering protocols shared across all projects.
- **README.md**: [Visual guide to the Three-Store Memory Architecture and Service Layer (Aether).](./gemini/README.md)
    - *Note: Project-specific rules are kept "out-of-band" from this repository and reside in their respective project roots at `.gemini/GEMINI.md`.*

### 🐚 Shell (`shell/`)
Version-controlled shell configuration files.
- **.bashrc**: Standard Bash config.
- **.zshrc**: Zsh with Oh My Zsh and plugins.

### 🛠️ Setup (`setup/`)
Infrastructure-as-code for environment reproduction.
- **bootstrap.sh**: Master script to install system tools, runtimes, and configs.
- **apt-packages.txt**: List of required system utilities.
- **npm-globals.txt**: List of required global JavaScript tools.
- **Runtimes Managed**:
    - **Python**: Installed and managed via [uv](https://github.com/astral-sh/uv).
    - **Node.js**: Managed via [nvm](https://github.com/nvm-sh/nvm).

## 🚀 Reproduction
To build this environment on a fresh WSL instance:
\`\`\`bash
git clone git@github.com:ChadHuckeba/dotfiles.git ~/dotfiles
cd ~/dotfiles/setup
./bootstrap.sh
\`\`\`

---
© 2026 SurvivalStack
n---
*This environment is optimized for AI-assisted development.*
