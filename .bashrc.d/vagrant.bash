vagrant_up() {
  if echo "$THINS_UP" | grep -qv "Vagrant: Vagrant version" ; then
    VAGRANT_HOME=/opt/vagrant
    [[ -s "${VAGRANT_HOME}/bin" ]] && export PATH="${VAGRANT_HOME}/bin:$PATH"
    add_things_up "Vagrant: $(vagrant --version | head -n 1)"
  fi
}
