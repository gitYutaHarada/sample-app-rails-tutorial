#!/usr/bin/env bash
chmod a+x bin/*

set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean

bin/rails db:migrate