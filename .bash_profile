# ~/.bash_profile: executed by bash(1) for login shells.

umask 007

PATH="~/bin:\
/Library/Frameworks/Python.framework/Versions/Current/bin:\
/opt/local/bin:\
/opt/local/sbin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/usr/X11/bin"

export PATH

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
