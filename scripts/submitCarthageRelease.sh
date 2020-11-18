#!/bin/bash

##TODO: as a function
UPSTREAM_REPO="apple/swift-protobuf"

LATEST_VERSION=`curl --silent "https://api.github.com/repos/$UPSTREAM_REPO/releases/latest" | jq -r .tag_name` || true


gh release create $LATEST_VERSION SwiftProtobuf.framework.zip  --title "$LATEST_VERSION" --notes "update from upstream"




