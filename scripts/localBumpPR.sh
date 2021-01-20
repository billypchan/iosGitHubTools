#!/bin/bash

### create a Github PR from local checkout

 git checkout develop
 cleanGitBranch.sh
 git pull
 bash bumpPR.sh