#!/usr/bin/env bash

set -eu -o pipefail

# exit if not run in the toplevel of a git worktree
[[ "$(pwd -P)" == "$(git rev-parse --show-toplevel 2>/dev/null)" ]] || exit 0

make
make README.md CRAM_INTERACTIVE="-i -y" || make README.md CRAM_INTERACTIVE="-i -y"
make clean
