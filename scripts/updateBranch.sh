## usage: update a branch with another branch and push it
## $ updateBranch.sh [branch] [another with update]
## e.g. updateBranch.sh chore/azure_xcode12 develop


git fetch
git checkout origin/$1
git merge origin/$2 --no-edit
git push
