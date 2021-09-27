#!/bin/bash

### usage: checkoutReleaseTag.sh [owner/repo]
### e.g. checkoutReleaseTag.sh apple/swift-protobuf
### install: macok: brew install jq

UPSTREAM_REPO=$1

echo "ℹ️ upstream repo is: $UPSTREAM_REPO"

LATEST_VERSION=`curl --silent "https://api.github.com/repos/$UPSTREAM_REPO/releases/latest" | jq -r .tag_name` || true

echo "ℹ️ upstream latest version is $LATEST_VERSION"

echo "ℹ️ checkout release tag"

git checkout tags/$LATEST_VERSION




