#!/bin/bash

export PATH=~/bin:/sbin:/usr/sbin:$PATH
export LANG=en_US.utf8

setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -layout dvorak

trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype percent --width 5 --transparent true --tint 0x000000 --height 12 &
parcellite &

xmodmap -e "remove Lock = Caps_Lock"

xrdb -merge $HOME/.Xresources
xscreensaver -no-splash &

exec xmonad
