#!/usr/bin/env bash

# Render a template into a commit on a git branch. By periodically merging that
# template branch into the main branch of a project, this allows keeping up to
# date with template changes.
#
# Inspired by:
#  - https://github.com/cookiecutter/cookiecutter/issues/784
#  - https://github.com/senseyeio/cupper
#  - https://github.com/thomasjahoda/cookiecutter_project_upgrader
#  - https://github.com/cruft/cruft

set -eu -o pipefail
shopt -s lastpipe

if [[ -t 1 ]]; then _o_tput_bold=$(tput bold || :); _o_tput_reset=$(tput sgr0 || :); else _o_tput_bold=; _o_tput_reset=; fi
function o { printf -->&2 "%s%s:%s%s\\n" "$_o_tput_bold" "${0##*/}" "$_o_tput_reset" "$(printf " %q" "$@")"; "$@"; }
function oo { printf -->&2 "%s%s:%s %s\\n" "$_o_tput_bold" "${0##*/}" "$_o_tput_reset" "$*"; }

options=$(
	env --unset=GETOPT_COMPATIBLE --unset=POSIXLY_CORRECT \
	getopt \
		-o ht:p:b:i: \
		--long help,template:,project:,branch:,input: \
		-- "$@"
)
eval "set -- $options"

template=
project=.
branch=template
input=
while (( $# )); do
	opt=$1; shift
	case "$opt" in
		-h|--help)
			echo "Usage: $0" \
				"[-h|--help]" \
				"[(-t|--template) TEMPLATE_DIR]" \
				"[(-p|--project) PROJECT_DIR]" \
				"[(-b|--branch) BRANCH]" \
				"[(-i|--input) EXTRA_CONTEXT_JSON]" \
				"[--] [cookiecutter EXTRA_CONTEXT]"
			exit
			;;

		-t|--template) template=$1; shift ;;
		-p|--project) project=$1; shift ;;
		-b|--branch) branch=$1; shift ;;
		-i|--input) input=$1; shift ;;
		--) break ;;
	esac
done

: "${template:?}"
: "${project:?}"
: "${branch:?}"

if [[ $input ]]; then
	jq -r 'to_entries[] | "\(.key)=\(.value)"' "$input" | readarray -t inputs
	set -- "${inputs[@]}" "$@"
fi

TMPDIR=$(mktemp -d)
export TMPDIR
# shellcheck disable=SC2064
trap "rm -rf $(printf %q "$TMPDIR")" EXIT

template_version=$(git -C "$template" describe --always --abbrev=10 --dirty)

project_current_branch=$(git -C "$project" branch --show-current)
remote=$(git -C "$project" branch --list "$project_current_branch" --format="%(upstream:remotename)")

tmp_worktree="$TMPDIR/worktree"
o git -C "$project" worktree prune
if git -C "$project" rev-parse -q --verify "$branch" 2>/dev/null; then
	o git -C "$project" worktree add --no-checkout "$tmp_worktree" "$branch"
elif git -C "$project" rev-parse -q --verify "$remote"/"$branch" 2>/dev/null; then
	o git -C "$project" worktree add --no-checkout -b "$branch" "$tmp_worktree" "$remote"/"$branch"
else
	o git -C "$project" worktree add --orphan -b "$branch" "$tmp_worktree"
fi

o cookiecutter \
	"${@+--no-input}" \
	--overwrite-if-exists \
	--output-dir "$tmp_worktree/.." \
	"$template" \
	"$@" _dest_dir="$(basename "$tmp_worktree")"

o git -C "$tmp_worktree" add -A .

last_commit_msg=$(git -C "$tmp_worktree" log -1 --pretty=format:%B 2>/dev/null || :)
commit_msg="Render template $template at $template_version"
git -C "$tmp_worktree" diff --quiet --exit-code --cached && changed= || changed=:

if [[ $changed || "$last_commit_msg" != "$commit_msg" ]]; then
	o git -C "$tmp_worktree" commit -m "$commit_msg" --allow-empty
else
	oo "Skipping commit, no changes and no new template version"
fi
