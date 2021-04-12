#!/usr/bin/env bash
#
# zsh
#
# This installs things for zsh.

set -e

# Check if oh-my-zsh is already installed.
if test ! $(which omz)
then
  echo "  Installing oh-my-zsh for you."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Keep the original .zshrc file we had.
  rm "$HOME/.zshrc"
  mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"
fi
