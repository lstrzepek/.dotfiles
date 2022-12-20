[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# ZSH Plugin manager: https://github.com/zap-zsh/zap
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "sindresorhus/pure"
# plug "spaceship-prompt/spaceship-prompt"
# source "$ZAP_PLUGIN_DIR/spaceship-prompt/spaceship.zsh"
# SPACESHIP_DIR_COLOR=blue
# SPACESHIP_GOLANG_SYMBOL='ﳑ '
# SPACESHIP_GOLANG_COLOR=magenta

plug "$ZDOTDIR/zsh-history"
plug "$ZDOTDIR/zsh-aliases"

#GoLang
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:$GOPATH/bin"
# Cargo
. $HOME/.cargo/env

# PyEnv - Manage Python versions
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
eval "$(pyenv init -)"

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude node_modules'
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
--layout=reverse --inline-info"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# BAT
BAT_THEME="Catppuccin-frappe"

# NNN
BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

function itermcolors() {
  (curl -Ls $1 > "/tmp/"$2".itermcolors" && open "/tmp/"$2".itermcolors")
}
