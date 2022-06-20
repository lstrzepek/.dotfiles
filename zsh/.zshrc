# Autocompletion
autoload -U compinit && compinit

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Load Spaceship - prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_DIR_COLOR=blue
SPACESHIP_GOLANG_SYMBOL='ﳑ '
SPACESHIP_GOLANG_COLOR=magenta

#bindkey -v
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

# Aliases
alias ls='ls -lAhG' #A-without . and .. G-color h-symlinks
alias md='mkdir -p' #p-create also intermediate dirs in a/b/c

# Color help
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

# Syntax highlight
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
