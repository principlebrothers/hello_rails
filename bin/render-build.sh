#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake db:migrate

# Export the development data
RAILS_ENV=development bundle exec rake db:pg_dump

# Copy the exported data to the Render environment
scp db/data.dump render@render-server:/app

# SSH into the Render server
ssh render@render-server

# Go to the app directory
cd /app

# Import the data into the Render PostgreSQL database
RAILS_ENV=production bundle exec rake db:pg_restore

# Exit the SSH session
exit
