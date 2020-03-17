
clean:
	rm -rf docs/build/html/*
.PHONY: clean

docs:
	make -C docs html
.PHONY: docs

publish-docs: docs
	rm -rf docs/build/html
	git clone --branch=gh-pages git@github.com:ReverentEngineer/git-code-review.git docs/build/html 
	rm -rf docs/build/html/*
	make -C docs html
	cd docs/build/html && git add ./* && git commit -m "Updates" && git push
