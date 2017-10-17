#! /bin/bash

set -eu

TRAVIS_BLOG_TOKEN=${DEPLOY_BLOG_TOKEN:-''}

if [ -z $TRAVIS_BLOG_TOKEN ]
then
  DEPLOY_REPO="git@github.com:pauldambra/blog_source.git"
else
  DEPLOY_REPO="https://${TRAVIS_BLOG_TOKEN}@github.com/pauldambra/pauldambra.github.io.git"
fi

echo "deploying changes"

if [ -z "${TRAVIS_PULL_REQUEST:-''}" ]; then
    echo "except don't publish site for pull requests"
    exit 0
fi  

if [ "${TRAVIS_BRANCH:-''}" != "master" ]; then
    echo "except we should only publish the master branch. stopping here"
    exit 0
fi

cd _site
git config --global user.name "Travis CI"
git config --global user.email paul.dambra+ttravis@gmail.com
git add -A
git fetch
git status
git commit -m "Lastest site built on successful travis build ${TRAVIS_BUILD_NUMBER:-'unknown'} auto-pushed to github"
git push $DEPLOY_REPO master:master