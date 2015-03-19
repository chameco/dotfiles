#!/bin/sh

#source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

#urxvt daemon
urxvtd -q -o -f &

#java fix
wmname LG3D

#set statusbar
conky | while read -r; do xsetroot -name "$REPLY"; done &

#background
feh --bg-fill `burrito get wallpaper`

#redshift
redshift -l 42.0683:-76.8216 -m vidmode &

#xresources
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
[[ -f ~/.burrito/xresources ]] && xrdb -merge ~/.burrito/xresources

#pulse
#start-pulseaudio-x11

exec dwm
