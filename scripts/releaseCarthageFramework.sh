## usage releaseCarthgaeFramework.sh "title" framework.zip 1.2.3

if [ $# -eq 0 ]; then
    echo 'please provide title, framework zip name and version'
    echo 'e.g. releaseCarthgaeFramework.sh "title" framework.zip 1.2.3'
    exit 1
fi


hub release create --copy -m $1 -a $2 $3
