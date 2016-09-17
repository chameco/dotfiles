export ZSH=/home/samuel/.oh-my-zsh

ZSH_THEME="risto"

plugins=(tmux git vi-mode)

source $ZSH/oh-my-zsh.sh

export PATH="/bin:/sbin:/usr/sbin:/home/samuel/bin:/home/samuel/.local/bin:/opt/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games/bin:/usr/bin:/usr/games/bin"

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim
export CC=gcc

alias vim=nvim
alias rm="rm -i"
alias mv="mv -i"
alias torrent="aria2c --seed-time=0 --max-upload-limit=1"
