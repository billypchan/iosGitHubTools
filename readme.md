# Scripts to working with XCode and Github

## Setup

run `setup.sh` to copy the scripts to `/usr/local/bin/`

### swiftLint
`brew install swiftlint`

https://github.com/realm/SwiftLint

## Usage
### release a version of current project
1. checkout the release branch
2. prepare the `release_notes.txt` (you may cd to /fastlane/metadata/en-US , but remeber ADD THE TITLE at the first line)
3. call `$releaseUIProj.sh [version number]`

e.g.
`releaseUIProj.sh 3.61`
