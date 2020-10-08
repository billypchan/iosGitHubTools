#!/bin/bash


# ### release a version of current project

# create a tag for the release version and create a release on Github

# #### steps
# 1. checkout the release branch
# 2. prepare the `release_notes.txt` (you may cd to /fastlane/metadata/en-US , but remeber ADD THE TITLE at the first line)
# 3. call `$releaseUIProj.sh [version number]`

# e.g.
# `releaseUIProj.sh 3.61`

version=$1

git tag "appstore/$1"
git push origin --tags
hub release create --file ./release_notes.txt --browse appstore/"$version"