source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"
gem "rails", "~> 7.0.0"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "redis", "~> 4.0"
gem "bootsnap", require: false

gem "devise", "~> 4.8"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
end

group :test do
  gem "rspec-rails", "~> 5.0"
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end


gem "jsbundling-rails", "~> 1.0"

gem "byebug", "~> 11.1"
