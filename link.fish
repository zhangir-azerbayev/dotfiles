# Get the script directory
set repo_dir (realpath (dirname (status -f)))

echo "WARNING: this will delete your existing config files. Press enter to continue"
read

function setup_config
    set -l dir $argv[1]
    set -l file $argv[2]

    mkdir -p $dir
    set config_path $dir/$file
    rm $config_path; or true
    ln -s $repo_dir/$file $config_path
end

# alacritty
setup_config $HOME/.config/alacritty alacritty.yml

# fish
setup_config $HOME/.config/fish config.fish

if not test -e $HOME/.config/fish/api_keys.fish
    touch $HOME/.config/fish/api_keys.fish
end

# nvim
setup_config $HOME/.config/nvim init.vim

# tmux
setup_config $HOME .tmux.conf

# vim
setup_config $HOME .vimrc

# tex snippets
setup_config $HOME/.vim/UltiSnips tex.snippets

# vs code keybindings
setup_config $HOME/.config/Code/User keybindings.json

# Xresources
setup_config $HOME .Xresources

# xinitrc
setup_config $HOME .xinitrc

# xmobar
setup_config $HOME .xmobarrc

# xmonad.hs
setup_config $HOME/.config/xmonad xmonad.hs
