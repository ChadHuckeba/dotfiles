#!/bin/bash

# SurvivalStack | WSL Environment Bootstrap (Idempotent)
# Usage: ./bootstrap.sh

set -e

echo "🚀 Starting Environment Bootstrap..."

# Helper to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# 1. System Updates & APT Packages
echo "Checking APT packages..."
sudo apt update
sudo apt install -y $(cat ~/dotfiles/setup/apt-packages.txt)

# 2. Setup NVM & Node
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

# Load NVM for current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if ! command_exists node; then
    echo "Installing Node LTS..."
    nvm install --lts
fi

# 3. Global NPM Packages
echo "Ensuring Global NPM Packages..."
for pkg in $(cat ~/dotfiles/setup/npm-globals.txt); do
    if ! npm list -g "$pkg" >/dev/null 2>&1; then
        echo "Installing $pkg..."
        npm install -g "$pkg"
    else
        echo "$pkg is already installed."
    fi
done

# 4. Setup Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already present."
fi

# 5. Finalize Symlinks
echo "Validating Symlinks..."

safe_link() {
    local source=$1
    local target=$2
    
    # If target is a real file (not a symlink), back it up
    if [ -f "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing file: $target to $target.bak"
        mv "$target" "$target.bak"
    fi
    
    ln -sf "$source" "$target"
}

mkdir -p ~/.gemini
safe_link ~/dotfiles/gemini/GEMINI.md ~/.gemini/GEMINI.md
safe_link ~/dotfiles/shell/.bashrc ~/.bashrc
safe_link ~/dotfiles/shell/.zshrc ~/.zshrc

echo "✅ Environment Bootstrap Complete!"
echo "Please restart your shell."
