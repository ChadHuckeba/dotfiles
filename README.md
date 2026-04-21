# SurvivalStack | Dotfiles
Personal configuration files and automated workflows for my development environment.

## 📁 Repository Structure

### ♊ Gemini CLI (`gemini/`)
Contains global instructions and workflows.
- **GEMINI.md**: Global "laws" and memories.

### 🐚 Shell (`shell/`)
Version-controlled shell configuration files.
- **.bashrc**: Standard Bash config.
- **.zshrc**: Zsh with Oh My Zsh and plugins.

### 🛠️ Setup (`setup/`)
Infrastructure-as-code for environment reproduction.
- **bootstrap.sh**: Master script to install APT packages, Node/NVM, and global tools.
- **apt-packages.txt**: List of required system utilities.
- **npm-globals.txt**: List of required global JavaScript tools.

## 🚀 Reproduction
To build this environment on a fresh WSL instance:
\`\`\`bash
git clone git@github.com:ChadHuckeba/dotfiles.git ~/dotfiles
cd ~/dotfiles/setup
./bootstrap.sh
\`\`\`

---
© 2026 SurvivalStack
