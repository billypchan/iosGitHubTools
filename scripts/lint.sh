git diff develop --name-only | while read filename; do

if [[ $filename == *.swift ]] 
then
	swiftlint --fix --path "$filename";
fi

done
