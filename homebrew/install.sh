#!/usr/bin/env bash
#
# Homebrew
#
# This installs Homebrew.

set -e

# Check if Homebrew is already installed.
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure we are up to date.
brew update

# Install mas if it is not already installed.
if test ! $(which mas)
then
  brew install mas
fi

# Sign into the App Store if not logged in.
if ! mas account >/dev/null
then
  echo "Not signed into the App Store."
  echo "Please sign in before running this script."
  # It'd be great if we could script this.
  # For now, there is a limitation that prevents it.
  # See also: https://github.com/mas-cli/mas/issues/164
  exit 1;
fi

# Install and run Bundle.
cd $ZSH/homebrew
brew bundle

exit 0
