#!/bin/sh
echo "Installing dependencies..."
ruby -v

# Install gems
bundle install

# Example about how to manage your dependency tool
pod install --repo-update

# This will solve fastlane path issues.
export PATH="$HOME/.fastlane/bin/fastlane_lib:$PATH"
