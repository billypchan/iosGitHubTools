#!/bin/bash

branch=$1

git checkout develop

git fetch
git pull

git branch "$branch"
git checkout "$branch"