source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.0'
gem 'rails', '5.2.2.1'
gem 'puma', '~> 3.7'

# frontend
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap', '~> 4.0.0'
gem 'high_voltage'
gem 'jquery-rails'

# authorizations and integrations
gem 'devise'
gem 'figaro'

# database
gem 'pg', '~> 0.18'
gem 'attr_encrypted', '~> 3.1.0'
gem 'paper_trail'

# admin
gem 'activeadmin'
gem 'activeadmin_addons'

# api
gem 'doorkeeper'
gem 'kaminari'
gem 'kaminari-grape'
gem 'grape', '1.2.3'
gem 'grape-entity', '0.7.1'
gem 'grape-swagger', '0.32.1'
gem 'grape-swagger-rails', '0.3.1'
gem 'grape-kaminari', '0.1.9'
gem 'rack-cors', require: 'rack/cors'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'spring-commands-rspec'
  gem 'rails_layout'

  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv'

  # code doctors
  gem 'rubocop'
  gem 'annotate', '2.7.2'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
end
