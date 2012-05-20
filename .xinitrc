#!/bin/bash

setxkbmap -option terminate:ctrl_alt_bksp
xloadimage -fullscreen -onroot -border fff $HOME/Pictures/castinheiro_do_eume.jpg


trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype percent --width 5 --transparent true --tint 0x000000 --height 12 &
parcellite &

xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "remove mod4 = Super_R"
xmodmap -e "keycode 104 = Super_R"
xmodmap -e "clear mod2"
xmodmap -e "add mod2 = Super_R"
xmodmap -e "keycode 96 = Insert"
#xmodmap ~/.xmodmap

xrdb -merge $HOME/.Xresources
xscreensaver -no-splash &

. $HOME/.bashrc.d/haskell.bash
haskell_up

exec xmonad
