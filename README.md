[![Coverage Status](https://coveralls.io/repos/taish/ubiregi/badge.png)](https://coveralls.io/r/taish/ubiregi)

# Ubiregi

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'ubiregi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ubiregi

## Quick Start Guide (Ubiregi API)

```ruby
client = Ubiregi::Connect::Client.new(
  access_token: "Your access token",
  refresh_token: "Your refresh token"
)
```

or

```ruby
client = Ubiregi::Connect::Client.new do |config|
  config.access_token  = "Your access token"
  config.refresh_token = "Your refresh token"
  config.client_id  = "Your client id"
  config.client_secret = "Your client secret"
end
```

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/ubiregi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
