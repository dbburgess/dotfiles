#!/usr/bin/env bash
#
# Run all dotfiles installers.

set -e

cd "$(dirname $0)"/..

# Find other installers and run them iteratively.
find . -name install.sh | grep -v "scripts\|homebrew" | while read installer ; do sh -c "${installer}" ; done
