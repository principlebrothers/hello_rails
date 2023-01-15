#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake db:migrate

# Export the development data
RAILS_ENV=development rake db:schema:load

# import the production data
