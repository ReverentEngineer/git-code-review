
clean:
	rm -rf docs/build/html/*
.PHONY: clean

docs:
	make -C docs html
.PHONY: docs

publish-docs: docs
	git worktree add docs/build/html/*
	rm -rf docs/build/html/*
	make -C docs html
	cd docs/build/html
	git add ./*
	git commit -m "Updates"
