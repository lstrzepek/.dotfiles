export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"
export CLICOLOR=1

# Set XDG Base Directory paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Set ZDOTDIR to move zsh configuration to XDG_CONFIG_HOME
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# eval "$(/opt/homebrew/bin/brew shellenv)"
# FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
# autoload -Uz compinit && compinit

setopt extended_glob null_glob

path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $HOME/dotnet
    $SCRIPTS
    $HOME/.krew/bin
    $HOME/.rd/bin                   # Rancher Desktop
    /home/vscode/.local/bin         # Dev Container Specifics
    /root/.local/bin                # Dev Container Specifics
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH

if [[ -f ~/.secret.zsh ]]; then
  . ~/.secret.zsh
fi
