#!/bin/bash

### usage: submitCarthageRelease.sh [upstream repo]
###e.g. submitCarthageRelease.sh apple/swift-protobuf

##TODO: as a function
UPSTREAM_REPO=$1

LATEST_VERSION=`curl --silent "https://api.github.com/repos/$UPSTREAM_REPO/releases/latest" | jq -r .tag_name` || true

SUBMIT_REPO=`git config --get remote.origin.url`

FRAMEWORK_ZIP=`ls *.framework.zip`

gh release create $LATEST_VERSION $FRAMEWORK_ZIP  --title "$LATEST_VERSION" --notes "update from upstream" --repo $SUBMIT_REPO




