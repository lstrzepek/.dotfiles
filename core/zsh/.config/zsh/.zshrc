if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/.zdumpfile"

fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
[ -f "$XDG_DATA_HOME/zap/zap.zsh" ] && source "$XDG_DATA_HOME/zap/zap.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
# zinit snippet OMZL::git.zsh
# zinit snippet OMZP::git
# zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
# zinit snippet OMZP::command-not-found# ZSH Plugin manager: https://github.com/zap-zsh/zap


# History
HISTSIZE=100000
HISTFILE=$XDG_DATA_HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
# alias ls='eza -a --icons' #A-without . and .. G-color h-symlinks
alias ls='ls -F'
alias md='mkdir -p' #p-create also intermediate dirs in a/b/c
alias dc='curl -Ls' #Download content from web
alias cat='bat'
alias lt='ls -l --tree'
alias tt='tmux new -s $(pwd | sed "s/.*\///g")'
alias wt='curl wttr.in/Katowice\?0T'
alias gb='git branch | fzf --header "Checkout Recent Branch" --preview "git diff {1} | delta" | xargs git checkout'
alias la='ls -a'
alias ll='ls -la'
alias tree='eza --tree --icons -a'
alias ts='tmux-session.zsh'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(op completion zsh)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude node_modules'
export FZF_DEFAULT_OPTS=" \
--layout=reverse --inline-info"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# BAT
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#Tmux
export PATH=$XDG_DATA_HOME/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

#1Password
source /Users/lstrzepek/.config/op/plugins.sh

# opam configuration
[[ ! -r /Users/lstrzepek/.opam/opam-init/init.zsh ]] || source /Users/lstrzepek/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

source "$ZDOTDIR/nord-theme.zsh"
source "$ZDOTDIR/prompt.zsh"
