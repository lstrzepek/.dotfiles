eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Dodaj narzędzia zestawu platformy .NET Core
export PATH="$PATH:/Users/lstrzepek/.dotnet/tools"

# Export local bin
export PATH="$PATH:/Users/lstrzepek/.local/bin"
