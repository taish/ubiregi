module Ubiregi
  module Connect
    module Configuration

      extend Forwardable

      attr_accessor :api_version, :endpoint
      def_delegator :options, :hash

      class << self

        def keys
          @keys ||= [
            :api_version,
            :endpoint
          ]
        end

      end

      def configure
        yield self
        self
      end

      # def reset!
      #   Ubiregi::Connect::Configuration.keys.each do |key|
      #     instance_variable_set(:"@#{key}", self.options[key])
      #   end
      #   self
      # end

    private

      # @return [Hash]
      def options
        Hash[Ubiregi::Connect::Configuration.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
      end

    end
  end
end
