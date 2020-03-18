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

git config --global user.name "Github Action"
git config --global user.mail "jeff@reverentengineer.com"
git clone --branch=gh-pages $URL docs/build/html
pushd docs/build/html && git rm -rf ./*
popd
make -C docs html
cd docs/build/html && git add ./* && git commit -m "Updates" && git push
