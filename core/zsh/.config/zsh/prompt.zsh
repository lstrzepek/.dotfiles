#!/bin/zsh
#
# autoload -Uz vcs_info
# autoload -U colors && colors
#
# zstyle ':vcs_info:*' enable git 
#
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
#
#
# zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# # 
# +vi-git-untracked(){
#     if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
#         git status --porcelain | grep '??' &> /dev/null ; then
#         hook_com[staged]+='!' # signify new files with a bang
#     fi
# }
#
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"
#
# PROMPT="%B%{$fg[yellow]%}⚡% %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT+="\$vcs_info_msg_0_ "

function setup_minimal_prompt() {
  # Load version control information
  autoload -Uz vcs_info
  
  # Configure vcs_info to only track git
  zstyle ':vcs_info:*' enable git
  # Enable checking for staged/unstaged changes
  zstyle ':vcs_info:git:*' check-for-changes true
  # Format: just branch name, plus staged/unstaged indicators
  zstyle ':vcs_info:git:*' formats '%b' '%c%u'
  
  # Function to be executed before each prompt
  function precmd() {
#    vcs_info
#    
#    # Get current directory (just the last component)
    local current_dir="%~"
#    
#    # If we're in a git repo, prepare the branch display
#    local git_info=""
#    if [[ -n $vcs_info_msg_0_ ]]; then
#      # Check if there are any changes in the repo
#      local git_status=""
#      if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
#        git_status="%F{magenta}*%f"
#      fi
#      git_info=" %F{blue}[%f ${vcs_info_msg_0_}%f${git_status}%F{blue}]%f"
#    fi
    
    # Set the prompt: cyan directory, blue git branch with magenta status indicator
    #PROMPT="%F{cyan}${current_dir}%f${git_info} %F{green}%f "
    PROMPT="%F{cyan}${current_dir}%f %F{green}%f "
  }
}

# Initialize the prompt
setup_minimal_prompt
