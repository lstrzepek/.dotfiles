# Installation
1. Install GNU Stow \
`brew install stow`

2. Clone this repo \
`git clone ~/.dotfiles`

3. Go to dotfiles \
`cd .dotfiles`

4. Stow will create symlinks for files in this repo \
`stow -vSt ~ */`

# Notes
`stow -nvt ~ *` -n means try, remember about path '~', * means all, you can use 'git' to do it only for git
`stow --adopt -nvt ~ *` adopt will include existing config into stow
`stow -vDt ~ zsh` will unlink file from stow for zsh dir
`stow -vt ~ */` only directories omit README etc.
