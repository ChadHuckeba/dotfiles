# SurvivalStack | Dotfiles
Personal configuration files and automated workflows for my development environment.

## 📁 Repository Structure

### ♊ Gemini CLI (`gemini/`)
Contains global instructions, personas, and automated workflows for the Gemini CLI agent.
- **GEMINI.md**: Global \"laws\" and memories shared across all projects.

## 🛠️ Management

### Symlinks
This repository uses symlinks to map configuration files from the `dotfiles/` directory to their expected locations in the home directory.

**Example (Gemini CLI):**
```bash
ln -s ~/dotfiles/gemini/GEMINI.md ~/.gemini/GEMINI.md
```

### Versioning
Changes to global instructions or added memories should be committed periodically:
```bash
cd ~/dotfiles
git add .
git commit -m \"Update configurations\"
git push origin main
```

---
© 2026 SurvivalStack
