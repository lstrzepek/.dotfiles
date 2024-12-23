# Installation

1. Clone this repo into home directory

```
cd ~
git clone git@github.com:lstrzepek/.dotfiles.git
```

2. Install all applications

```
cd ~/.dotfiles
brew bundle
```

3. Apply core configuration

```
cd core
stow -vt ~ *\
```

## Maintenance

*All cmmands contains `-n` option for sefety reasons*

* To unlink configuration
```
stow -nvDt ~ */
```

* To take configuration and make it part of dotfiles repository
```
mkdir -p <name>/.config
mv ~/.config/<name> ~/.dotfiles/<name>/.config/<name>
```

### stow options
`stow -nvt ~ *` -n means try, remember about path '~', * means all, you can use 'git' to do it only for git
`stow --adopt -nvt ~ *` adopt will include existing config into stow
`stow -vDt ~ zsh` will unlink file from stow for zsh dir
`stow -vt ~ */` only directories omit Brefile etc.

# Acknowledgments

[Josh Medeski](https://github.com/joshmedeski/dotfiles)
[Luke Smith](https://github.com/LukeSmithxyz/voidrice)
[Elijah Manor](https://www.youtube.com/@ElijahManor)
[Lokesh Krishna](https://github.com/lokesh-krishna/dotfiles)

## Wallpapers

(Alena Aenami)[https://aenamiart.artstation.com]

# Description

* Window Manager: AeroSpace - tile window manager, places windows on screen but also allow to use wirtual desktop
* Terminal Emulator: Alacritty - connection between MacOs and terminal applications i.e. shell. Handles keyboard mappings for keys which are not supported in terminal like Command key
* Shell: Zsh - Default shell for MacOs. Should be never use directly in Alacritty
* Tmux - Terminal multiplexer, to manage multiple terminal session, windows and panes
* Editor: NeoVim

## Theme
Configure themes as env variables rather than in separate config files
