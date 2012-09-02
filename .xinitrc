#!/bin/bash

setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -layout dvorak
#xloadimage -fullscreen -onroot -border fff $HOME/Pictures/castinheiro_do_eume.jpg


trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype percent --width 5 --transparent true --tint 0x000000 --height 12 &
parcellite &

xmodmap -e "remove Lock = Caps_Lock"
#xmodmap ~/.xmodmap

xrdb -merge $HOME/.Xresources
xscreensaver -no-splash &

exec xmonad
