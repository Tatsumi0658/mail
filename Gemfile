source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Core
gem 'rails', '~> 5.2.2'

#Middlewave
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

#Front/View
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootstrap', '~>4.1.1'
gem 'jquery-rails'

#Background
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave'
gem 'mini_magick'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'faker'

#Other
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
