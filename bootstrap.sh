#!/usr/bin/env bash

set -u

abort() {
  printf "%s\n" "$@"
  exit 1
}

# First check if Bash is available.
if [ -z "${BASH_VERSION:-}" ]; then
  abort "Bash is required to interpret this script."
fi

# Next, check the OS.
OS="$(uname)"
if [[ "$OS" != "Darwin" ]]; then
  abort "macOS is the only supported platform at the moment."
fi

# Install Command Line Tools, if needed.
if ! [[ -e "/Library/Developer/CommandLineTools/usr/bin/git" ]]; then
  echo "Install Command Line Tools..."
  sudo /usr/bin/xcode-select --install
  read -n 1 -s -r -p "Press any key once installation has completed."
  sudo /usr/bin/xcode-select --switch /Library/Developer/CommandLineTools
fi

if [ ! -d "$HOME/.dotfiles" ]; then
  echo "Bootstrapping dotfiles for the first time..."
  git clone https://github.com/dbburgess/dotfiles.git "$HOME/.dotfiles"
  $HOME/.dotfiles/scripts/bootstrap.sh
else
  echo "dotfiles already setup."
  echo ""

  echo "Do you want to run the bootstrap install again for good measure?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) $HOME/.dotfiles/scripts/bootstrap.sh; break;;
      No ) exit;;
    esac
  done
fi
