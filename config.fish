
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/zhangir/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# aliased ssh commands 
# see `tmux` section for `rename` command
alias ziva="rename ziva; ssh -o ServerAliveInterval=30 -J zaa7@tangra.cs.yale.edu zaa7@ziva.cs.yale.internal"
alias morana="rename morana; ssh -o ServerAliveInterval=30 -J zaa7@tangra.cs.yale.edu zaa7@morana.cs.yale.edu"
alias tangra="rename tangra; ssh -o ServerAliveInterval=30 zaa7@tangra.cs.yale.edu"
alias vesna="rename vesna; ssh -o ServerAliveInterval=30 -J zaa7@tangra.cs.yale.edu zaa7@vesna.cs.yale.internal"
alias stability="rename stability; ssh -i ~/.ssh/id_ed25519 -o ServerAliveInterval=30 zhangir.azerbayev@grantwest.hpc.stability.ai"
alias byu="rename byu; ssh -o ServerAliveInterval=30 za2514@ssh.rc.byu.edu"

# nvim 
alias vim="nvim"
alias vi="nvim"
alias oldvim="/bin/vim"

# exa
alias ls="exa"

# tmux
alias rename="tmux rename-window"

# don't remember why I have this, it might be for Dafny
set -gx PATH $PATH $HOME/.dotnet/tools

# api keys
source ~/.config/fish/api_keys.fish
