#!/bin/bash

set -e

REPO=`git config --get remote.origin.url | sed 's/.*\/\([^ ]*\/[^.]*\).*/\1/'`

echo "repo is: $REPO"

LATEST_VERSION=`curl --silent "https://api.github.com/repos/$REPO/releases/latest" | jq -r .tag_name` || true

echo "latest verion is: {$LATEST_VERSION}"

NEXTVERSION=`echo $LATEST_VERSION | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g'`

echo "next verion is: {$NEXTVERSION}"

git tag $NEXTVERSION
git push origin --tags
gh release create $NEXTVERSION --title $NEXTVERSION --notes $NEXTVERSION
