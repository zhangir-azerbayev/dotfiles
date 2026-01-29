#!/bin/zsh

# Get the script directory
repo_dir="$(cd "$(dirname "$0")" && pwd)"

echo "WARNING: this will delete your existing config files. Press enter to continue"
read

mkdir -p "$HOME/.config"

setup_config() {
    local dir="$1"
    local file="$2"

    mkdir -p "$dir"
    local config_path="$dir/$file"
    rm -f "$config_path"
    ln -s "$repo_dir/$file" "$config_path"
}

# nvim
rm -f "$HOME/.config/nvim"
ln -s "$repo_dir/nvim" "$HOME/.config/nvim"

# alacritty
setup_config "$HOME/.config/alacritty" alacritty.toml

# zsh
setup_config "$HOME" .zshrc

# tmux
setup_config "$HOME" .tmux.conf

# tex snippets
setup_config "$HOME/.vim/UltiSnips" tex.snippets
