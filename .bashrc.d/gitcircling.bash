
gitcircling.up() {
  TOPGIT_PREFIX="/opt/tools/topgit"
  GIT_TEMPLATE_PREFIX="~/src/git-template"
  GIT_PROJECT_TEMPLATE_DIRECTORY="${GIT_TEMPLATE_PREFIX}/template"
  export PATH="${TOPGIT_PREFIX}/bin:${PATH}:${GIT_TEMPLATE_PREFIX}/bin"
  export GIT_PROJECT_TEMPLATE_DIRECTORY
  . "${TOPGIT_PREFIX}/etc/tg-completion.bash"
  if ! sed --version | grep "GNU" ; then
    echo "GNU sed not found on path; topgit depends on it"
  fi
}
