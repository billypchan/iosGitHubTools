git diff develop --name-only | while read filename; do

if [[ $filename == *.swift ]] 
then
	swiftlint autocorrect --path "$filename";
fi

done
