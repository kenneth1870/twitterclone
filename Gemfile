# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>= 3.0.0'

gem 'http', '~> 5.1'
gem 'puma', '~> 5.0'
gem 'rack', '~> 2.2.7'
gem 'rails', '~> 7.0.7', '>= 7.0.7.2'
gem 'sprockets', '~> 3.7.2'
gem 'thor', '~> 1.2'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use twitter bootstrap sass
gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'pg'
gem 'psych', '< 4'

gem 'carrierwave'
gem 'devise'
gem 'friendly_id'

gem 'backstretch-rails'
gem 'will_paginate'

gem 'bootsnap'
gem 'counter_culture'
gem 'rails_autolink'
gem 'remotipart'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'guard'
  gem 'guard-rspec'
  gem 'letter_opener'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers'
  gem 'webmock', require: 'webmock/rspec'
end

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'populator'
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'to_factory'
end

group :production do
  gem 'unicorn'
end
