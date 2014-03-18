require 'faraday'
require 'faraday_middleware'
require 'ubiregi/connect/configuration'
require 'ubiregi/request'
require 'ubiregi/response'
require 'ubiregi/error/server_error'
require 'ubiregi/error/client_error'

module Ubiregi
  module Connect
    class Client
      include Ubiregi::Connect::Configuration
      include Ubiregi::Request

      attr_accessor :access_token, :refresh_token, :client_id, :client_secret
      ENDPOINT = 'https://ubiregi.com/oauth2/authorize'

      # Initializes a new Client object
      #
      # @param options [Hash] A customizable set of options.
      # @option access_token [String]
      # @option refresh_token [String]
      # @return [Ubiregi::Client]
      def initialize(options={})

        options.each do |key, value|
          send(:"#{key}=", value)
        end

        yield(self) if block_given?

        validate_credential_type!
        # Set global keys
        # Ubiregi::Connect::Configuration.keys.each do |key|
        #   instance_variable_set(:"@#{key}", options[key] || Ubiregi::Connect.instance_variable_get(:"@#{key}"))
        # end
      end

      # @return [Hash]
      def credentials
        {
          :access_token  => access_token,
          :refresh_token => refresh_token,
          :client_id     => client_id,
          :client_secret => client_secret,
        }
      end

    private

      # Ensures that all credentials set during configuration are of a
      # valid type. Valid types are String and Symbol.
      #
      # @raise [Ubiregi::Error::ConfigurationError] Error is raised when
      #   supplied twitter credentials are not a String or Symbol.
      def validate_credential_type!
        credentials.each do |credential, value|
          next if value.nil?
          fail(Ubiregi::Error::ClientError.new("Invalid #{credential} specified: #{value.inspect} must be a string or symbol.")) unless value.is_a?(String) || value.is_a?(Symbol)
        end
      end

      # Returns a Faraday::Connection object
      #
      # @return [Faraday::Connection]
      def connection
        @connection ||= Faraday.new(ENDPOINT) do |conn|
          conn.request :oauth2, @access_token if @access_token
          conn.request :url_encoded
          conn.request :json
          conn.response :json, content_type: /\bjson$/
          conn.use Ubiregi::Response::RaiseError, Ubiregi::Error::ClientError
          conn.use Ubiregi::Response::RaiseError, Ubiregi::Error::ServerError
          conn.adapter Faraday.default_adapter
        end
      end
    end
  end
end
