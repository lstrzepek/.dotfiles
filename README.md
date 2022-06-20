git clone ~/.dotfiles/


stow -nvt ~ *;-n means try, remember about path '~', * means all, you can use 'git' to do it only for git
stow --adopt -nvt ~ * ;adopt will include existing config into stow
stow -vDt ~ zsh ;will unlink file from stow 
stow -vt ~ */ ;only directories omit README etc.
stow <dir> will restore dir in .config
