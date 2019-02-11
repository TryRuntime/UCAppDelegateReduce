build: install open

open: 
	- open ./Example/UCAppDelegateReduce.xcworkspace
quit:
	- osascript -e 'quit app "Xcode"'
install:
	- pod install --project-directory=Example
delete pod:
	- pod deintegrate
clean cache:
	pod cache clean --all
test:
	- xcodebuild -scheme UCAppDelegateReduce-Example -workspace Example/UCAppDelegateReduce.xcworkspace -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone Xs,OS=12.1' build test
lint:
	- pod lib lint --allow-warnings
push:
	- pod trunk push --allow-warnings
