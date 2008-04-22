#!/bin/sh
#
# ~/.xinitrc
#xcompmgr -cCfF -r7 -o.65 -l-10 -t-8 -D7 &
xset m 0 0 & # Disable mouse accel
xsetroot -solid '#222222' -cursor_name left_ptr & # Cursor theme
urxvtd -o -q -f &
nitrogen --restore & # Wallpaper
mpd &
xbindkeys &
unclutter -root -idle 5 &
xrdb ~/.Xdefaults &

mkdir -p ~/.amazing/logs
amazing >> ~/.amazing/logs/amazing.log 2>> ~/.amazing/logs/error.log &

urxvtc -e screen -RR &

exec /usr/bin/awesome
#ruby /home/gig/hacks/dwm.rb | /usr/bin/dwm
#exec /usr/bin/wmii
#exec /usr/bin/openbox
