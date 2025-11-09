#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# Remove cached node_modules to ensure clean install for Linux platform
rm -rf node_modules
npm install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
