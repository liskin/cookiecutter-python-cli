DEMO_BRANCH := demo
DEMO_DATA := \
	name="Demo DEMO" \
	author_name="Tomas Janousek" \
	author_email=tomi@nomi.cz \
	author_github=liskin \
	author_paypal=lisknisi

.PHONY: demo
demo:
	./update.sh --template . --branch $(DEMO_BRANCH) $(DEMO_DATA)

.PHONY: clean
clean:
	git clean -ffdX
	git worktree prune
