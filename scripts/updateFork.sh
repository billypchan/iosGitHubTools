## usage: update a forked repo with upstream
## updateFork.sh [upstream repo]
## e.g. updateFork.sh https://github.com/apple/swift-protobuf

echo "add upstream repo: $1"

git remote add upstream $1
git fetch upstream
git checkout master
git merge upstream/master
git push
