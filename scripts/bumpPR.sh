#!/bin/bash

set -e

updateCartfile () {
    echo "👊 bumping line: $1"
    [[ $1 =~ ^github\ \"(.*)\".+ ]]
    
    CHILD_REPO=${BASH_REMATCH[1]}
    echo "👊 CHILD_REPO is: $CHILD_REPO"

    ### continue after failed for now, e.g. "2.3-swift3.1"
    LATEST_VERSION=`curl --silent "https://api.github.com/repos/$CHILD_REPO/releases/latest" | jq -r .tag_name` || true
    
    echo "👊 latest version is: $LATEST_VERSION"

    ESCAPED_CHILD_REPO=$(printf '%s\n' "$CHILD_REPO" | sed -e 's/[\/&]/\\&/g')

    ###TODO: cannot handle version with string, e.g. github "wireapp/PINCache" "2.3-swift3.1"
    ### continue on error, e.g. '~>' is missing
    sed -i "" "s/\(github \"$ESCAPED_CHILD_REPO\" ~> \)\(.*\)$/\1$LATEST_VERSION/g" Cartfile || true
}


echo "👊 ceating branch..."
git branch chore/bump
git checkout chore/bump

while read p; do
    echo $p
    updateCartfile "$p"
done <Cartfile

echo "👊 after update Cartfile"
cat Cartfile

###TODO: check private cartfile also

carthage update --no-build
git add .
git commit -m"bump components"
git push --set-upstream origin chore/bump

echo "👊 open PR"

### assign one of KaterinaWire/marcomaddy1982/johnxnguyen/David-Henner/billypchan/typfel as a reviewer
arr[0]="KaterinaWire"
arr[1]="marcomaddy1982"
arr[2]="johnxnguyen"
arr[3]="David-Henner"
arr[4]="billypchan"
arr[5]="typfel"
rand=$[$RANDOM % ${#arr[@]}]

#gh pr create --reviewer KaterinaWire,marcomaddy1982,johnxnguyen,David-Henner --title "chore: bump components" --body "bump for components"
gh pr create --reviewer "$rand" --title "chore: bump components" --body "bump for components"
