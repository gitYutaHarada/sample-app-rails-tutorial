#!/usr/bin/env bash
# exit on error
set -o errexit

# Fix permissions for bin files
chmod +x bin/*

bundle install
# Remove cached node_modules to ensure clean install for Linux platform
rm -rf node_modules
npm install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset
bundle exec rails db:seed