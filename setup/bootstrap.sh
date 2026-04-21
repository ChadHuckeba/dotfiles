#!/bin/bash

# SurvivalStack | WSL Environment Bootstrap
# Usage: ./bootstrap.sh

set -e

echo "🚀 Starting Environment Bootstrap..."

# 1. System Updates & APT Packages
sudo apt update
sudo apt install -y $(cat ~/dotfiles/setup/apt-packages.txt)

# 2. Setup NVM & Node (if not present)
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

nvm install --lts

# 3. Global NPM Packages
echo "Installing Global NPM Packages..."
npm install -g $(cat ~/dotfiles/setup/npm-globals.txt)

# 4. Setup Oh My Zsh (if not present)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 5. Finalize Symlinks
echo "Creating Symlinks..."
# Gemini
mkdir -p ~/.gemini
ln -sf ~/dotfiles/gemini/GEMINI.md ~/.gemini/GEMINI.md
# Shell
ln -sf ~/dotfiles/shell/.bashrc ~/.bashrc
ln -sf ~/dotfiles/shell/.zshrc ~/.zshrc

echo "✅ Environment Bootstrap Complete!"
echo "Please restart your shell."
