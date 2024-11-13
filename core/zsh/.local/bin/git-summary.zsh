#!/bin/zsh

# Function to check if the provided path is a Git repository
is_git_repository() {
  local path="$1"
  if [ -d "$path/.git" ]; then
    return 0
  else
    return 1
  fi
}

# Function to get the current branch name
get_current_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  echo "$branch"
}

# Function to check if the current branch has uncommitted changes
has_uncommitted_changes() {
  if [ -n "$(git status --porcelain)" ]; then
    return 0
  else
    return 1
  fi
}

# Function to check if the current branch has unpushed commits
has_unpushed_commits() {
  if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
    # No commits yet
    return 1
  fi
  
  if ! git show-ref --verify --quiet "refs/remotes/origin/$(get_current_branch)"; then
    # No remote branch
    return 0
  fi
  
  if [ -n "$(git log origin/$(get_current_branch)..HEAD)" ]; then
    return 0
  else
    return 1
  fi
}

# Function to count unpushed commits
count_unpushed_commits() {
  local branch=$(get_current_branch)
  if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
    # No commits yet
    echo 0
    return
  fi
  
  if ! git show-ref --verify --quiet "refs/remotes/origin/$branch"; then
    # No remote branch
    echo $(git rev-list --count HEAD)
    return
  fi
  
  echo $(git rev-list --count origin/$branch..HEAD)
}

# Main script
if [ -z "$1" ]; then
  exit 0
fi

if is_git_repository "$1"; then
  pushd "$1" >/dev/null
  
  local branch=$(get_current_branch)
  local has_changes=$(has_uncommitted_changes)
  local has_unpushed=$(has_unpushed_commits)
  
  if [[ $has_changes -eq 0 ]]; then
    local changes="*"
  fi
  
  if [[ $count_unpushed_commits != 0 ]]; then
    local unpushed=" 󰅧"
  fi
  
    echo " $branch#[fg=magenta,bold]${changes:-}#[fg=white,nobold]${unpushed:-} "
  
  popd >/dev/null
else
  exit 0
fi
