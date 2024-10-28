[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# ZSH Plugin manager: https://github.com/zap-zsh/zap
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
#plug "zap-zsh/nvm"
plug "wintermi/zsh-starship"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d"

plug "$ZDOTDIR/zsh-lf"

# === History
HISTSIZE=5000
HISTFILE=$XDG_CACHE_HOME/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST


# === Aliases
#alias ls='ls -lAhG' #A-without . and .. G-color h-symlinks
alias ls='eza -a --icons' #A-without . and .. G-color h-symlinks
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


# === Colors
export LS_COLORS="$(vivid generate nord)"
export EXA_COLORS="uu=30:uR=35:ur=32:uw=33:ux=35:ue=35:gr=32:gw=33:gx=35:tr=32:tw=33:tx=35:da=32"

#export CLICOLOR=YES
#test -r "~/.local/bin/dir_colors" && eval $(gdircolors ~/.local/bin/dir_colors)
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#GoLang
#export GOPATH="$XDG_DATA_HOME/go"
#export PATH="$PATH:$GOPATH/bin"

# Cargo
#. $HOME/.cargo/env

# # PyEnv - Manage Python versions
# export PYENV_ROOT=$XDG_DATA_HOME/pyenv
# eval "$(pyenv init -)"

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

#1Password
source /Users/lstrzepek/.config/op/plugins.sh

# opam configuration
[[ ! -r /Users/lstrzepek/.opam/opam-init/init.zsh ]] || source /Users/lstrzepek/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
