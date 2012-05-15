
rvm_up() {
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  [[ -s "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
}

rbenv_up() {
  [[ -s "$HOME/.rbenv/bin" ]] && export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
}
