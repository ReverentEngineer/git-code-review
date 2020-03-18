#!/bin/bash

if [[ -z ${GITHUB_ACTOR} ]]; then
  echo "No GITHUB_ACTOR defined."
  exit 1;
fi

if [[ -z ${GITHUB_TOKEN} ]]; then
  echo "No GITHUB_TOKEN defined."
  exit 1;
fi

URL=https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/ReverentEngineer/git-code-review 

git clone --branch=gh-pages $URL docs/build/html
pushd docs/build/html && git rm -rf ./*
popd
make -C docs html
cd docs/build/html

if [[ $(git diff-index --quiet HEAD --) -eq 1 ]]; then
  git config --local user.name "Github Action"
  git config --local user.mail "jeff@reverentengineer.com"
  git add ./*
  git commit -m "Updates"
  git --force push
else
  echo "No changes."
fi
