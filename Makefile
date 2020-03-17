ifdef GITHUB_TOKEN
	URL := https://$(GITHUB_TOKEN)@github.com/ReverentEngineer/git-code-review
else
	URL := git@github.com:ReverentEngineer/git-code-review.git
endif

clean:
	rm -rf docs/build
.PHONY: clean

docs:
	make -C docs html
.PHONY: docs

publish-docs: docs
	git clone --branch=gh-pages $(URL) docs/build/html 
	cd docs/build/html && git rm -rf ./*
	make -C docs html
	cd docs/build/html && git add ./* && git commit -m "Updates" && git push
