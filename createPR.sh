#!/bin/bash

repo=$1
title=$2
message=$3

hub pull-request -f --push --browse --message "$title\
$message"

echo "Check any compile error and tell the team to review!!"
