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


    export SESSION_NAME="tarena"
    greenonwhite="\033[47m"
    PROMPT_COMMAND='rvm=$([[ -x ~/.rvm/bin/rvm-prompt ]] && ~/.rvm/bin/rvm-prompt i v p g s);\
                    echo -ne "\033]0;${SESSION_NAME}|\
rvm:$rvm|\
$(__git_ps1 "branch:%s")|\
$(date "+%y%m%d %H:%M")\
\007";\
                    echo -e "${greenonwhite}$PWD\033[0m"'

    PS1='\u@\h '

    for extra_rc in ~/.bashrc.d/*.bash ; do
        source ${extra_rc}
    done
fi

