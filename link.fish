# Get the script directory
set repo_dir (realpath (dirname (status -f)))

echo "WARNING: this will delete your existing config files. Press enter to continue"
read

# alacritty
mkdir -p $HOME/.config/alacritty
set alacritty_config_path $HOME/.config/alacritty/alacritty.yml
rm $alacritty_config_path; or true
ln -s $repo_dir/alacritty.yml $alacritty_config_path

# fish
mkdir -p $HOME/.config/fish
set fish_config_path $HOME/.config/fish/config.fish
rm $fish_config_path; or true
ln -s $repo_dir/config.fish $fish_config_path

if not test -e $HOME/.config/fish/api_keys.fish
    touch $HOME/.config/fish/api_keys.fish
end

# nvim
mkdir -p $HOME/.config/nvim
set nvim_config_path $HOME/.config/nvim/init.vim
rm $nvim_config_path; or true
ln -s $repo_dir/init.vim $nvim_config_path

# tmux
set tmux_config_path $HOME/.tmux.conf
rm $tmux_config_path; or true
ln -s $repo_dir/.tmux.conf $tmux_config_path

# vim
set vim_config_path $HOME/.vimrc
rm $vim_config_path; or true
ln -s $repo_dir/.vimrc $vim_config_path

