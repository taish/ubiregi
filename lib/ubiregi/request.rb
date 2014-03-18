require 'faraday'
require 'ubiregi/error/client_error'

module Ubiregi
  module Request

    def get(path, params={})
      request(:get, path, params)
    end

    def post(path, params={})
      request(:post, path, params)
    end

    def put(path, params={})
      request(:put, path, params)
    end

    def delete(path, params={})
      request(:delete, path, params)
    end

  private

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection
      raise NotImplementedError, 'abstract method: connection'
    end

    def request(method, path, params={})
      connection.send(method.to_sym, path, params).env
    rescue Faraday::Error::ClientError then raise Ubiregi::Error::ClientError
    end

  end
end
