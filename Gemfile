# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.0'
gem 'puma', '~> 4.3'
gem 'rails', '5.2.3'

# frontend
gem 'bootstrap'
gem 'coffee-rails', '~> 4.2'
gem 'high_voltage'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'

# authorizations and integrations
gem 'devise'
gem 'figaro'

# database
gem 'attr_encrypted', '~> 3.1.0'
gem 'paper_trail'
gem 'pg', '~> 0.18'

# admin
gem 'activeadmin'
gem 'activeadmin_addons'

# api
gem 'doorkeeper'
gem 'grape', '1.2.3'
gem 'grape-entity', '0.7.1'
gem 'grape-kaminari', '0.1.9'
gem 'grape-swagger', '0.32.1'
gem 'grape-swagger-rails', '0.3.1'
gem 'kaminari'
gem 'kaminari-grape'
gem 'rack-cors', require: 'rack/cors'

group :development do
  gem 'better_errors'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails_layout'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'

  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv'

  # code doctors
  gem 'annotate', '2.7.2'
  gem 'rubocop'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
end

group :staging, :production do
  gem 'exception_notification'
end
