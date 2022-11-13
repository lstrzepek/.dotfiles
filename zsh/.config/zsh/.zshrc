[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# ZSH Plugin manager: https://github.com/zap-zsh/zap
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "spaceship-prompt/spaceship-prompt"
source "$ZAP_PLUGIN_DIR/spaceship-prompt/spaceship.zsh"
SPACESHIP_DIR_COLOR=blue
SPACESHIP_GOLANG_SYMBOL='ﳑ '
SPACESHIP_GOLANG_COLOR=magenta

plug "$ZDOTDIR/zsh-history"
plug "$ZDOTDIR/zsh-aliases"

# PyEnv - Manage Python versions
eval "$(pyenv init -)"

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

