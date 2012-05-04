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


    export SESSION_NAME="taric"
    greenonwhite="\033[33m"
    PROMPT_COMMAND='echo -ne "\033]0;${SESSION_NAME}|\
$(__git_ps1 "branch:%s")|\
$(date "+%y%m%d %H:%M")\
\007";\
                    echo -e "${greenonwhite}$PWD\033[0m"'

    PS1='\u@\h '

    export EDITOR="vim"
    export VISUAL="vim"

    add_things_up() {
      local thing=$1
      export THINGS_UP="${THINGS_UP}\n$(date -u "+%Y%m%d %H:%M UTC") ${thing}"
    }
    register_things_available() {
      local thing=$1
      local description=$2
      local version=$3

      export THINGS_AVAILABLE="${THINGS_AVAILABLE}\n${thing} ${description} ${version}"
    }
    things_available() {
      echo -e "${THINGS_AVAILABLE}"
    }
    things_already_up() {
      echo -e "${THINGS_UP}"
    }
    [ "${THINGS_UP}x" == "x" ] && \
      export THINGS_UP="Session started $(date -u "+%Y%m%d %H:%M UTC")\n\n-- Things up --"
    [ "${THINGS_AVAILABLE}x" == "x" ] && \
      export THINGS_AVAILABLE="Shell things available:\n"

    for extra_rc in ~/.bashrc.d/*.bash ; do
        source ${extra_rc}
    done
fi

