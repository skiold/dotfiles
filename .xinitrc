#!/bin/bash

setxkbmap -option terminate:ctrl_alt_bksp
xloadimage -fullscreen -onroot -border fff $HOME/Pictures/castinheiro_do_eume.jpg

xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "remove mod4 = Super_R"
xmodmap -e "keycode 104 = Super_R"
xmodmap -e "clear mod2"
xmodmap -e "add mod2 = Super_R"
#xmodmap ~/.xmodmap

xrdb -merge $HOME/.Xresources

. $HOME/.bashrc.d/haskell.bash
haskell_up

exec xmonad
