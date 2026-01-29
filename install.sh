#!/bin/zsh

# Install all macOS dependencies for these dotfiles (excluding LaTeX).

set -e

# Homebrew
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Pull submodules (nvim config)
git submodule update --init --recursive

# Core tools
brew install git
brew install tmux
brew install ripgrep
brew install gh

# Neovim — brew's stable formula can lag behind; install from HEAD for latest
brew install --HEAD neovim

# Terminal emulator + font
brew install --cask alacritty
brew install --cask font-hack-nerd-font

echo "Done. Run ./link.sh to symlink config files."
