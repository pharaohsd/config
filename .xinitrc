#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#xcompmgr -cCfF -r7 -o.65 -l-10 -t-8 -D7 &
xset m 0 0 & # Disable mouse accel
xsetroot -solid '#222222' -cursor_name left_ptr & # Cursor theme
urxvtd -o -q -f &
nitrogen --restore & # Wallpaper
mpd &
xbindkeys &
xmodmap ~/.Xmodmap &
xrdb ~/.Xdefaults &
(sleep 2 && urxvtc -e screen -RR && pidgin) &
(sleep 3 && urxvtc -e ncmpc) &
(sleep 4 && urxvtc) &

(amazing -s && amazing) & # Feeds awesome widgets

exec /usr/bin/awesome
#ruby /home/gig/hacks/dwm.rb | /usr/bin/dwm
#exec /usr/bin/xmonad
#exec /usr/bin/wmii
#exec /usr/bin/openbox
