require 'ubiregi/connect/configuration'
require 'ubiregi/connect/client'

module Ubiregi
  module Connect
    class << self
      include Ubiregi::Connect::Configuration

      # Delegate to a Ubiregi::Connect::Client
      #
      # @return [Ubiregi::Connect::Client]
      def client
        unless defined?(@client) && @client.hash == options.hash
          @client = Ubiregi::Connect::Client.new(options)
        end
        @client
      end

      def respond_to?(method, include_private=false)
        client.respond_to?(method, include_private)
      end

    private

      def method_missing(method, *args, &block)
        return super unless client.respond_to?(method)
        client.send(method, *args, &block)
      end

    end
  end
end

# Ubiregi::Connect.reset!
