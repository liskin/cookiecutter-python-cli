DEMO_BRANCH := demo
DEMO_DATA := \
	name="Demo DEMO" \
	author_name="Tomas Janousek" \
	author_email=tomi@nomi.cz \
	author_github=liskin \
	author_paypal=lisknisi

.PHONY: tmp
## Generate demo project into the .tmp subdirectory.
## Specify RM= to avoid cleaning the subdirectory first.
tmp:
	$(if $(RM),$(RM) -r .tmp)
	cookiecutter \
		--no-input \
		--overwrite-if-exists \
		--output-dir .tmp \
		. \
		_dest_dir=. \
		_setuptools_scm_root=.. \
		$(DEMO_DATA)

.PHONY: demo
## Generate demo project into a demo branch using the update.sh machinery.
demo:
	./update.sh --template . --branch $(DEMO_BRANCH) $(DEMO_DATA)

.PHONY: clean
## Clean (remove all gitignored files and prune worktrees).
clean:
	git clean -ffdX
	git worktree prune

include _help.mk
