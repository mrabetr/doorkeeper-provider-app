# frozen_string_literal: true

source "http://rubygems.org"

ruby "2.6.6"

gem "rails", "~> 6.1"
gem "doorkeeper", "~> 5.5.3"
gem "devise", "~> 4.8"
gem 'pkce_challenge'
gem 'doorkeeper-openid_connect'

gem "faker"
gem "jquery-rails"

gem "coderay"
gem "redcarpet"

gem "uglifier"
gem "pg", "~> 1.2", group: :production
gem "rollbar"

gem "puma"
gem "rack-timeout"

group :development do
  gem "listen"
  gem "rubocop-performance"
  gem "rubocop-rails_config"
  gem 'dotenv-rails'
end

group :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "database_cleaner"
  gem 'dotenv-rails'
end

group :development, :test do
  gem "sqlite3"
  gem "pry-rails"
end
