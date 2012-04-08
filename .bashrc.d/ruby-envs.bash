
rvm.up() {
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  [[ -s "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
}

rbenv.up() {
  [[ -s "$HOME/.rbenv/bin" ]] && export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
}
