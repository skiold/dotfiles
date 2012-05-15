#!/bin/bash

haskell_up() {
  if echo "$THINGS_UP" | grep -qv "Haskell: $(ghc --version)" ; then
    export PATH="${HOME}/.cabal/bin:/opt/haskell/bin:${PATH}:/opt/local/libexec/gnubin"
    add_things_up "Haskell: $(ghc --version)"
  fi
}
