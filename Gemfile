source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'html_to_plain_text', '~> 1.0.5'
gem 'httparty', '~> 0.14.0'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'dotenv-rails', '~> 2.1.1'
  gem 'pry', '~> 0.10.4'
  gem 'rspec', '~> 3.5.0'
  gem 'rspec-rails', '~> 3.5.2'
  gem 'rubocop', '~> 0.46.0', require: false
  gem 'sqlite3', '~> 1.3.13'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
