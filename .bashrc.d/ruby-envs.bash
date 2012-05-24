
rvm_up() {
  if echo "$THINGS_UP" | grep -qv "Rvm" ; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
    [[ -s "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
    add_things_up "Rvm"
  fi
}

rbenv_up() {
  if echo "$THINGS_UP" | grep -qv "Rbenv: $(rbenv 2>&1 | head -n 1)" ; then
    [[ -s "$HOME/.rbenv/bin" ]] && export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
    add_things_up "Rbenv: $(rbenv 2>&1 | head -n 1)"
  fi
}
