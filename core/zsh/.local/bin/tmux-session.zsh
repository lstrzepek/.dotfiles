#!/usr/bin/env zsh

# Strict mode
set -euo pipefail

if [ -z "${1:-}" ]; then
  session_dir="$(zoxide query -l | fzf)"
else
  session_dir="$(zoxide query $1)"
fi

echo "Selected dir:" $session_dir
session_name="$(basename $session_dir)"
echo "Selected session:" $session_name

if [[ -z "${TMUX:-}" ]]; then
  echo "Not in tmux"  
  tmux new-session -As $session_name -c $session_dir
else
  echo "In tmux"
  # In tmux
  if ! tmux has-session -t $session_name 2>/dev/null; then
    echo "no session creating"
    tmux new-session -s $session_name -c $session_dir -d
  fi
    echo "switch to session"
    tmux switch-client -t $session_name
fi

