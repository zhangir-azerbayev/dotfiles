# Enable vim mode
bindkey -v


# Git alias
alias g='git'

# vim aliases
alias oldvim='/usr/bin/vim'
alias vim='/opt/homebrew/bin/nvim'
alias v='/opt/homebrew/bin/nvim'

# claude
alias cc='claude --dangerously-skip-permissions'
alias cdx='codex --dangerously-bypass-approvals-and-sandbox --search'

# Let prompts expand variables like ${...}
setopt prompt_subst

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
