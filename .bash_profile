# ~/.bash_profile: executed by bash(1) for login shells.

umask 007

PATH="~/bin:\
~/devel/perl/bin:\
/Library/Frameworks/Python.framework/Versions/Current/bin:\
/opt/local/bin:\
/opt/local/sbin:\
~/local/bin:\
/usr/local/bin:\
/usr/local/mysql/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/usr/local/bin:\
/usr/local/git/bin:\
/usr/X11/bin"

# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"

# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
