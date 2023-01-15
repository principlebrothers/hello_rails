#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake db:migrate

# Export the development data
RAILS_ENV=development rake db:schema:load

# Import the data into the Render PostgreSQL database
RAILS_ENV=production bundle exec rake db:schema:load

# Exit the SSH session
exit
