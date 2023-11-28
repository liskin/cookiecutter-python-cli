DEMO_BRANCH := demo
DEMO_DIR := demo-demo
DEMO_DATA := \
	name="Demo DEMO" \
	author_name="Tomas Janousek" \
	author_email=tomi@nomi.cz \
	author_github=liskin \
	author_paypal=lisknisi

.PHONY: demo
demo:
	$(RM) -r $(DEMO_DIR)
	git worktree prune
	if git rev-parse -q --verify origin/$(DEMO_BRANCH) 2>/dev/null; then \
		git worktree add --no-checkout -B $(DEMO_BRANCH) $(DEMO_DIR) origin/$(DEMO_BRANCH); \
	elif git rev-parse -q --verify $(DEMO_BRANCH) 2>/dev/null; then \
		git worktree add --no-checkout -B $(DEMO_BRANCH) $(DEMO_DIR) $(DEMO_BRANCH); \
	else \
		git worktree add --orphan -B $(DEMO_BRANCH) $(DEMO_DIR); \
	fi
	cookiecutter --default-config --no-input --overwrite-if-exists . $(DEMO_DATA)
	git -C $(DEMO_DIR) add -A .
	make -C $(DEMO_DIR)
	-make -C $(DEMO_DIR) check CRAM_INTERACTIVE="-i -y"
	-make -C $(DEMO_DIR) check CRAM_INTERACTIVE="-i -y"
	git -C $(DEMO_DIR) add -u .
	make -C $(DEMO_DIR) check
	version=$$(git describe --always --abbrev=10 --dirty) && git -C $(DEMO_DIR) commit -m "Render template at $$version" --allow-empty

.PHONY: clean
clean:
	git clean -ffdX
	git worktree prune
