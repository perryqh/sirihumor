source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'haml',                    '~> 3.1.3'
gem 'thin',                    '~> 1.2.11'
gem 'json',                    '~> 1.6.1'
gem 'twitter-bootstrap-rails', :git => 'http://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'less-rails',              '>= 2.0.1'
gem 'pg',                      '0.11.0'
gem 'carrierwave',             '~> 0.5.7'
gem 'fog',                     '~> 1.0'
gem 'rmagick',                 '~> 2.13.1'
gem 'settingslogic',           '~> 2.0.6'
gem 'simple-navigation',       '~> 3.5.0'
gem 'high_voltage',            '~> 1.0.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',            "~> 3.1.0"
  gem 'coffee-rails',          "~> 3.1.0"
  gem 'uglifier',              "~> 1.0.3"
end

gem 'jquery-rails',            "~> 1.0.16"

group :test do
  gem 'rspec-rails',           '>= 2.7.0'
  gem 'factory_girl_rails',    '>= 1.2.0'
  gem 'turn',                  :require => false
  gem 'guard-rspec',           '>= 0.5.2'
  gem 'guard-spork',           '>= 0.3.1'
  gem 'guard-bundler',            '>= 0.1.3'
  gem "spork",                 '>= 0.9.0.rc9'
  gem 'remarkable',               '>=4.0.0.alpha4'
  gem 'remarkable_activemodel',   '>=4.0.0.alpha4'
  gem 'remarkable_activerecord',  '>=4.0.0.alpha4'
  gem 'database_cleaner',      '>= 0.6.7'
  gem 'capybara',              '>= 1.1.1'
end

unless ENV["TRAVIS"]
  gem 'ruby-debug19', :group => [:development, :test]
  group :test do
    gem 'rb-fsevent', :require => false
  end
end




