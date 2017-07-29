source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
gem 'fast_blank'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# A faster memcached client?
gem 'dalli'
gem 'nokogiri'
# gem 'twitter'
# gem 'scenic'
gem 'bugsnag'
gem 'ahoy_email'
# Making HTML emails comfortable for the Rails rockstars
gem 'roadie-rails', '~> 1.0'
gem 'aasm'
gem 'kaminari'
gem 'haml'
gem 'awesome_print'
gem 'settingslogic'
# gem 'memoist'
# gem 'hashie'
# Business intelligence made simple
# gem 'blazer'
# Use Redis adapter to run Action Cable in production
gem 'redis'
gem 'redis-rails'
# gem 'scenic'

gem 'sidekiq', '< 6'
gem 'sidekiq-cron'
group :production, :development do
  # this gem doesn't play well with Faking sidekiq jobs
  gem 'sidekiq-unique-jobs'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.4'
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'letter_opener'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard' #, '2.13.0' # NOTE: this is necessary in newer versions of guard-minitest
  gem 'guard-minitest', require: false
  gem 'guard-rspec', require: false
  gem 'guard-livereload', require: false

  # Use Capistrano for deployment
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-yarn'
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'
  gem 'capistrano-inspeqtor', require: false
end

group :test do
  gem 'vcr'
  gem 'webmock' #, '~> 2.3.2'
  # adds support for "assigns(:name)" and other test helpers
  # gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
