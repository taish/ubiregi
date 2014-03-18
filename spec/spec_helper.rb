# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ubiregi'
require 'vcr'
require 'webmock/rspec'
require 'coveralls'
require 'simplecov'

VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr_cassettes'
    c.hook_into :webmock
    c.allow_http_connections_when_no_cassette = true
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
  Coveralls.wear!
]

SimpleCov.start do
  add_filter '/spec/'
end

include WebMock::API

def a_get(path)
  a_request(:get, Ubiregi::Connect::Client::ENDPOINT + path)
end

def a_post(path)
  a_request(:post, Ubiregi::Connect::Client::ENDPOINT + path)
end

def a_put(path)
  a_request(:put, Ubiregi::Connect::Client::ENDPOINT + path)
end

def a_delete(path)
  a_request(:delete, Ubiregi::Connect::Client::ENDPOINT + path)
end

def stub_get(path)
  stub_request(:get, Ubiregi::Connect::Client::ENDPOINT + path)
end

def stub_post(path)
  stub_request(:post, Ubiregi::Connect::Client::ENDPOINT + path)
end

def stub_put(path)
  stub_request(:put, Ubiregi::Connect::Client::ENDPOINT + path)
end

def stub_delete(path)
  stub_request(:delete, Ubiregi::Connect::Client::ENDPOINT + path)
end
