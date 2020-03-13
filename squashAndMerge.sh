#!/bin/bash

issueNumber=$1

hub api -XPUT repos/wireapp/wire-ios/pulls/"$issueNumber"/merge -F merge_method=squash
