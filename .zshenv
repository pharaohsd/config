#!/bin/zsh
#
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/mozilla/bin:/opt/java/jre/bin:/home/gig/bin:/home/gig/hacks
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LOCALE=en_US.UTF-8

bindkey "\e[1~" beginning-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[3~" delete-char

bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
  dbus-launch startx >& .myXLog
  logout
fi
