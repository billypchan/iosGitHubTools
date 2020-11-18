#!/bin/bash

### usage: checkoutReleaseTag.sh [owner/repo]
###e.g. checkoutReleaseTag.sh apple/swift-protobuf

UPSTREAM_REPO=$1

LATEST_VERSION=`curl --silent "https://api.github.com/repos/$UPSTREAM_REPO/releases/latest" | jq -r .tag_name` || true

echo "ℹ️ upstream latest version is $LATEST_VERSION"

echo "ℹ️ creating release"

git checkout tags/$LATEST_VERSION




