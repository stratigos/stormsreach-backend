source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Environment config

ruby "2.5.0"

# Application stack

gem "rails", "~> 5.1.5"
gem "pg"
gem "puma", "~> 3.7"

# Application dependencies
gem "bcrypt", "~> 3.1.7" # Use ActiveModel has_secure_password
gem "bootstrap_sb_admin_base_v1", "~> 0.1.0" # admin / CMS theme
gem "sass-rails", "~> 5.0" # SCSS stylesheets
gem "uglifier", ">= 1.3.0" # compress JS assets
# gem "therubyracer", platforms: :ruby # JS runtime

# Environment specific dependencies

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "rspec-rails", "~> 3.7.2"
  gem "factory_bot_rails", "~> 4.8.2"
  gem "shoulda-matchers", "~> 3.1.2"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
