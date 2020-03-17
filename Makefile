URL := git@github.com:ReverentEngineer/git-code-review.git
ifdef GITHUB_TOKEN
ifdef GITHUB_ACTOR
	URL := https://$(GITHUB_ACTOR):$(GITHUB_TOKEN)@github.com/ReverentEngineer/git-code-review
endif
endif

clean:
	rm -rf docs/build
.PHONY: clean

docs:
	make -C docs html
.PHONY: docs

publish-docs:
	rm -rf docs/build/html
	@git clone --branch=gh-pages $(URL) docs/build/html 
	cd docs/build/html && git rm -rf ./*
	make -C docs html
	cd docs/build/html && git add ./* && git commit -m "Updates" && git push
