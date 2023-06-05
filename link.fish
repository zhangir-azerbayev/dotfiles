# Define the ~/.config parent directory and pwd. Must use absolute paths.
set config_dir $argv[1]
set repo_dir $argv[2]

# alacritty
mkdir -p $config_dir/alacritty
ln -s $repo_dir/alacritty.yml $config_dir/alacritty/alacritty.yml

# fish
mkdir -p $config_dir/fish
ln -s $repo_dir/config.fish $config_dir/fish/config.fish

if not test -e $config_dir/fish/api_keys.fish
    touch $config_dir/fish/api_keys.fish
end

# nvim
mkdir -p $config_dir/nvim
ln -s $repo_dir/init.vim $config_dir/nvim/init.vim

# tmux
ln -s $repo_dir/.tmux.conf ~/.tmux.conf
