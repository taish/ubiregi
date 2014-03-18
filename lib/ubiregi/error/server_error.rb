require 'ubiregi/error/base'

module Ubiregi
  module Error
    # Raised when Ubiregi returns a 5xx HTTP status code
    class ServerError < Ubiregi::Error::Base
      MESSAGE = 'Server Error'

      # Create a new error from an HTTP environment
      #
      # @param response [Hash]
      # @return [Ubiregi::Error::Base]
      def self.from_response(response={})
        new(nil, response[:response_headers])
      end

      # Initializes a new ServerError object
      #
      # @param message [String]
      # @param response_headers [Hash]
      # @return [Ubiregi::Error::ServerError]
      def initialize(message=nil, response_headers={})
        super((message || self.class.const_get(:MESSAGE)), response_headers)
      end

    end
  end
end
