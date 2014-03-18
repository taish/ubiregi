source 'https://rubygems.org'

# Specify your gem's dependencies in ubiregi.gemspec
gem 'rake'
gem 'yard'

group :development do
  gem 'simple_oauth', '~>0.2.0'
  gem 'faraday', '~>0.8.9'
  gem 'faraday_middleware', '~>0.9.0'
  gem 'pry'
  gem 'guard-rspec'
  platforms :ruby_19, :ruby_20, :ruby_21 do
    gem 'pry-stack_explorer'
  end
end

group :test do
  gem 'backports'
  gem 'coveralls', :require => false
  gem 'rspec', '>= 2.14'
  gem 'simplecov', :require => false
  gem 'webmock', '~>1.17.4'
  gem 'vcr', '~> 2.8.0'
end

gemspec