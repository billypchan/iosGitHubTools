## usage: update a forked repo with upstream
## updateFork.sh [upstream repo]
## e.g. updateFork.sh https://github.com/apple/swift-protobuf

echo "add upstream repo: $1"

BRANCH=`git branch --show-current`

git remote add upstream $1
git fetch upstream
git checkout $BRANCH
git merge upstream/$BRANCH
git push
