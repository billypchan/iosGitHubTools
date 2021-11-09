#!/bin/bash

# exit when any command fails
set -e

### usage: xcframework.sh [xcodeproj filename] [scheme] [framework name]
### e.g. xcframework.sh ZipArchive ZipArchive-iOS ZipArchive


if [ $# -ne 3 ]
  then
    echo "No arguments supplied"
    echo "usage: xcframework.sh [xcodeproj filename] [scheme] [framework name]"
    exit
fi

xcodeproj=$1
scheme=$2
framework=$3

xcodebuild archive -project "$xcodeproj.xcodeproj" \
-scheme "$scheme" \
-configuration Release -destination 'generic/platform=iOS' \
-archivePath "./$xcodeproj.framework-iphoneos.xcarchive" \
SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive -project "$xcodeproj.xcodeproj" -scheme "$scheme" -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath "./$xcodeproj.framework-iphonesimulator.xcarchive" SKIP_INSTALL=NO  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework  \
-framework "./$xcodeproj.framework-iphoneos.xcarchive/Products/Library/Frameworks/$framework.framework" \
-debug-symbols `pwd`"/$xcodeproj.framework-iphoneos.xcarchive/dSYMs/$framework.framework.dSYM" \
-framework "./$xcodeproj.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/$framework.framework" \
-debug-symbols `pwd`"/$xcodeproj.framework-iphonesimulator.xcarchive/dSYMs/$framework.framework.dSYM" \
-output "$framework.xcframework"

zip -r $framework.xcframework.zip "$framework.xcframework"
