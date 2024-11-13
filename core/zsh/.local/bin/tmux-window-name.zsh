#!/usr/bin/env zsh

# Declare associative array
typeset -A program_codes
typeset -A flags_map
# Define mappings
program_codes=(
    "bash"  ""
    "zsh"   ""
    "tmux"  ""
    "nvim"  ""
    "vi"    ""
    "vim"   ""
    "top"   ""
    "htop"  ""
    "btop"  ""
    "python"  ""
)

flags_map=(
  "*Z"   ""
  )

parse_program() {
    local input="${1:l}"  # Convert to lowercase
    if [ "$2" = "1" ]; then
      zoom=""
    fi
    echo "${program_codes[$input]:-$input} ${zoom:-}"  # Return '?' if not found
}

parse_program $1 $2
