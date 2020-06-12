#!/bin/bash

version=$1

git tag "appstore/$1"
git push origin --tags
hub release create --file ./release_notes.txt --browse appstore/"$version"