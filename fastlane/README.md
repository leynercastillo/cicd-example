fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios develop
```
fastlane ios develop
```
Creates Develop build
### ios test_unit
```
fastlane ios test_unit
```
Type can be any of following: appstore, adhoc, development, enterprise

Runs all the Unit tests
### ios match_update_develop
```
fastlane ios match_update_develop
```
Retrieve and update (where needed) all provisioning profiles and signing identity for Development using Match

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
