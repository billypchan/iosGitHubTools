#!/bin/bash

set -e

CHILD_REPO="wireapp/wire-ios-utilities"

LATEST_VERSION=`curl --silent "https://api.github.com/repos/$CHILD_REPO/releases/latest" | jq -r .tag_name`
echo "👊 latest version is: $LATEST_VERSION"

echo "👊 ceating branch..."
git branch chore/bump
git checkout chore/bump
echo "👊 before update Cartfile"
cat Cartfile

ESCAPED_CHILD_REPO=$(printf '%s\n' "$CHILD_REPO" | sed -e 's/[\/&]/\\&/g')

sed -i "" "s/\(github \"$ESCAPED_CHILD_REPO\" ~> \)\(.*\)$/\1$LATEST_VERSION/g" Cartfile

echo "👊 after update Cartfile"

cat Cartfile
carthage update --no-build
git add .
git commit -m"bump $CHILD_REPO"
git push --set-upstream origin chore/bump

echo "👊 open PR"
gh pr create --title "chore: bump $CHILD_REPO" --body "bump for $CHILD_REPO"
