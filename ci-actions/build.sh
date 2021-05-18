#!/bin/sh
# Propagate errors
set -e

if [ $branch_name = "develop" ]; then
    bundle exec fastlane test_unit
    bundle exec fastlane develop

fi