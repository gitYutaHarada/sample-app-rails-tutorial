source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.join(__dir__, ".ruby-version")).strip.sub(/\Aruby-/, "")

gem "rails", "~> 7.1.3"
gem "sassc-rails", "~> 2.1"
gem "sprockets-rails", "~> 3.5"
gem "importmap-rails", "~> 2.0"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "turbo-rails", "~> 2.0"
gem "stimulus-rails", "~> 1.3"
gem "jbuilder", "~> 2.12"
gem "concurrent-ruby", "~> 1.3"
gem "bootsnap", require: false
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "bootstrap-sass", "~> 3.4.1"
gem "bcrypt", "~> 3.1.7"
gem "image_processing", "~> 1.2"
gem "kamal", require: false
gem "thruster", require: false
gem "faker", "~> 3.2"
gem "will_paginate", "~> 3.3"
gem "bootstrap-will_paginate", "~> 1.0"

group :development, :test do
  gem "reline", "~> 0.5.10"
  gem "debug", "~> 1.9", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console", "~> 4.2"
  gem "solargraph", "~> 0.50"
  gem "irb", "~> 1.13"
  gem "repl_type_completor", "~> 0.1.10"
  gem "guard"
  gem "guard-minitest"
  gem "guard-rubocop", require: false
  gem "wdm", ">= 0.1.1", platforms: %i[ mingw x64_mingw mswin ]
end

group :test do
  gem "capybara", "~> 3.40"
  gem "selenium-webdriver", ">= 4.6", "< 5.0"
  gem "rails-controller-testing", "~> 1.0"
  gem "minitest", "~> 5.26"
  gem "minitest-reporters", "~> 1.6"
end

gem "tzinfo-data", platforms: %i[ windows jruby ]
