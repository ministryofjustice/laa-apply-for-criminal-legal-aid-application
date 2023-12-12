source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

gem 'aws-sdk-s3', '~> 1.140'
gem 'bootsnap', '~> 1.17.0', require: false
gem 'dartsass-rails', '~> 0.5.0'
gem 'govuk_notify_rails', '~> 2.2.0'
gem 'httparty'
gem 'importmap-rails'
gem 'laa_multi_step_forms', path: './gems/laa_multi_step_forms'
gem 'logstasher', '~> 2.1'
gem 'pagy'
gem 'pg', '~> 1.5'
gem 'puma', '~> 6.4'
gem 'rails', '~> 7.1.2'
gem 'sentry-rails', '~> 5.15.0'
gem 'sentry-ruby', '~> 5.15.0'
gem 'sidekiq', '~> 7.2'
gem 'sidekiq_alive', '~> 2.3'
gem 'sidekiq-cron'
gem 'sprockets-rails'
gem 'turbo-rails', '~> 1.5.0'
gem 'tzinfo-data'

# required as can't specify github in gemspe for laa_multi_step_form
gem 'hmcts_common_platform', github: 'ministryofjustice/hmcts_common_platform', tag: 'v0.2.0'

group :development, :test do
  gem 'debug'
  gem 'dotenv-rails'
  gem 'erb_lint', require: false
  gem 'pry'
  gem 'rspec-expectations'
  gem 'rspec-rails'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'capybara'
  gem 'cuprite', '~> 0.15'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-html-matchers'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'simplecov'
  gem 'simplecov-lcov'
  gem 'simplecov-rcov'
  gem 'super_diff'
end
