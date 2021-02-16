#!/bin/bash

### Create a Github PR from local checkout
### The last line of the this script's output is the URL of the PR

 git checkout develop
 cleanGitBranch.sh
 git branch -d chore/bump
 git pull
 bash bumpPR.sh
