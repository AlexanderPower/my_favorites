source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.2.1'
gem 'therubyracer', platforms: :ruby

# Users
gem 'devise'

# JSON
gem 'jbuilder', '~> 2.0'

# Docs
gem 'sdoc', '~> 0.4.0', group: :doc

# Front-end
gem 'uglifier', '>= 1.3.0'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml-rails'
gem 'sass-rails', '~> 5.0.1'
gem 'jquery-turbolinks'

# DB
gem 'pg'

# Data
gem 'countries'

gem 'markable', git: 'git://github.com/chrome/markable.git'

# Test
group :test do
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'faker'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.3.6'
end

# Production
group :production do
  # gem 'puma'
  gem 'rails_12factor'
  # gem "rails_serve_static_assets"
end