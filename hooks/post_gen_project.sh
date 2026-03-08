#!/usr/bin/env bash

set -eu -o pipefail

# exit if not run in the toplevel of a git worktree
[[ "$(pwd -P)" == "$(git rev-parse --show-toplevel 2>/dev/null)" ]] || exit 0

# fill outputs of prysk tests
just test-prysk -i -y || :

# fill readme includes
just readme </dev/null

# clean for git add -A
just clean
