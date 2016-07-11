#!/bin/sh

#source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

#urxvt daemon
xset +fp /usr/share/fonts/terminus
urxvtd -q -o -f &

#cursor fix
xsetroot -cursor_name left_ptr&

#java fix
wmname LG3D

#set statusbar
xsetroot -name "`sensei statusbar`"
while sleep 10; do xsetroot -name "`sensei statusbar`"; done &

#background
#feh --bg-fill `burrito get wallpaper`

#redshift
redshift -l 42.0683:-76.8216 -m randr &

#xresources
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
[[ -f ~/.burrito/xresources ]] && xrdb -merge ~/.burrito/xresources

#backlight
xbacklight -set 50

exec dwm
