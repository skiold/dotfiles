[ -f ~/.ssh/config ] && complete -W "$(awk '/^host/ {print $2}' ~/.ssh/config | sort | uniq)" ssh
