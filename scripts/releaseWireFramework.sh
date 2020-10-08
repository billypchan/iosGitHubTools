
## usage releaseFramework.sh wire-ios-mocktransport 126 major

if [ $# -eq 0 ]; then
    echo 'please provide framework name, PR number and release type(major/minor/patch)'
    echo 'e.g. releaseFramework.sh wire-ios-request-strategy 208 major'
    exit 1
fi


## TODO: get current path, current PR number
hub api -X POST repos/wireapp/$1/issues/$2/comments --raw-field "body=@zenkins release $3"