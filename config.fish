
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/zhangir/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# aliased ssh commands 
# see `tmux` section for `rename` command
alias ziva="rename ziva; ssh -J zaa7@tangra.cs.yale.edu zaa7@ziva.cs.yale.internal"
alias morana="rename morana; ssh -J zaa7@tangra.cs.yale.edu zaa7@morana.cs.yale.edu"
alias tangra="rename tangra; ssh zaa7@tangra.cs.yale.edu"
alias vesna="rename vesna; ssh -J zaa7@tangra.cs.yale.edu zaa7@vesna.cs.yale.internal"
alias stabilitycpu="rename stabilitycpu; ssh -i ~/.ssh/id_ed25519 zhangir.azerbayev@cpu.hpc.stability.ai"
alias eleuther="rename eleuther; ssh -i ~/.ssh/id_ed25519 zhangir.azerbayev@eleuther.hpc.stability.ai"

# nvim 
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

# tmux
alias rename="tmux rename-window"

# don't remember why I have this
set -gx PATH $PATH $HOME/.dotnet/tools

# api keys
source ~/.config/fish/api_keys.fish
