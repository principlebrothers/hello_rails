#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake db:migrate

# export the data in the development database to production
bundle exec rake db:export

# run the tests
bundle exec rake test

# run the build
bundle exec rake build
