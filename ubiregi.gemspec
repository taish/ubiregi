# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ubiregi/version'

Gem::Specification.new do |spec|
  spec.name          = "ubiregi"
  spec.version       = Ubiregi::VERSION
  spec.authors       = ["taish"]
  spec.email         = ["kbystis@gmail.com"]
  spec.summary       = spec.description
  spec.description   = %q{A Ruby interface to the Ubiregi API.}
  spec.homepage      = "https://github.com/taish/ubiregi"
  spec.license       = "MIT"

  spec.require_paths = ["lib"]
  spec.files         += Dir.glob('lib/**/*.rb')
  spec.files         += Dir.glob('spec/**/*')
  spec.test_files    = Dir.glob('spec/**/*')

  spec.add_dependency 'faraday', ['~> 0.8', '< 0.9']
  spec.add_dependency 'faraday_middleware', '~> 0.9.0'
  spec.add_dependency 'simple_oauth', '~> 0.2'

  spec.add_development_dependency 'webmock'
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
end
