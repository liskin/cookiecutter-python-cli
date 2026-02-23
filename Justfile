help:
	@just --list

# ----------------------------------------------------------------------

demo_branch := "demo"
demo_data := """
	name="Demo DEMO"
	author_name="Tomas Janousek"
	author_email=tomi@nomi.cz
	author_github=liskin
	author_paypal=lisknisi
"""

# Generate demo project into the .tmp subdirectory, removing it first.
tmp-rm: && tmp
	rm -r .tmp

# (Re)generate demo project into the .tmp subdirectory.
tmp:
	cookiecutter \
		--no-input \
		--overwrite-if-exists \
		--output-dir .tmp \
		. \
		_dest_dir=. \
		_setuptools_scm_root=.. \
		{{ replace_regex(demo_data, '\s+', ' ') }}

# Generate demo project into a demo branch using the update.sh machinery.
demo:
	./update.sh \
		--template . \
		--branch {{demo_branch}} \
		{{ replace_regex(demo_data, '\s+', ' ') }}

# Clean (remove all gitignored files and prune worktrees).
clean:
	git clean -ffdX
