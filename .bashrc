# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

# If running interactively, then:
if [ "$PS1" ]; then

    # enable color support of ls and also add handy aliases
    #eval `dircolors`
    alias ls='ls -G '
    alias ll='ls -l '
    alias la='ls -A '
    alias l='ls -CF '
    alias tail='tail -f '
	
    #emacs client
    alias em='open -a /Applications/Emacs.app/ '


    #alias de seguridad:
    alias rm='rm -i '
    alias cp='cp -i '
    alias mv='mv -i '

    alias ssh-add='/usr/bin/ssh-add'

    # set a fancy prompt
    PS1='\u@\h:\w() '

    # git thingies
    . ~/.git-completion.bash
    TERM="linux"
    export TERM
    PS1='$(__git_ps1 "|%s|")@\h:\W() '

    for extrarc in ~/.bashrc.d/*.bash ; do
	. ${extrarc}
    done
fi

