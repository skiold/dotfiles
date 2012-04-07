[ -f ~/.ssh/config ] && complete -W "$(echo `awk '/^Host/ {print \$2}' ~/.ssh/config | sort | uniq`)" ssh
