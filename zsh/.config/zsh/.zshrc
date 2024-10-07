[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# ZSH Plugin manager: https://github.com/zap-zsh/zap
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-starship"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

plug "$ZDOTDIR/zsh-history"
plug "$ZDOTDIR/zsh-aliases"
plug "$ZDOTDIR/zsh-lf"

#Colors
export LS_COLORS="$(vivid generate nord)"
export EXA_COLORS="uu=30:uR=35:ur=32:uw=33:ux=35:ue=35:gr=32:gw=33:gx=35:tr=32:tw=33:tx=35"

#export CLICOLOR=YES
#test -r "~/.local/bin/dir_colors" && eval $(gdircolors ~/.local/bin/dir_colors)
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

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
--layout=reverse --inline-info"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=info:#eacb8a,prompt:#bf6069,pointer:#a3be8b
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
    --color=bg:-1,bg+:-1,gutter:-1,hl:#81a1c1'
    # --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    # --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# BAT
export BAT_THEME="Nord"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Zoxide
eval "$(zoxide init zsh)"

#Tmux
export PATH=$XDG_DATA_HOME/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
source /Users/lstrzepek/.config/op/plugins.sh

# opam configuration
[[ ! -r /Users/lstrzepek/.opam/opam-init/init.zsh ]] || source /Users/lstrzepek/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
