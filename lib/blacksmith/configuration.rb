module Blacksmith
  class Configuration < SimpleDelegator
    def builder
      Builder.new(self)
    end

    class Builder
      attr_reader :configuration

      def initialize(configuration)
        @configuration = configuration
      end

      def forge(name, options)
        configuration[:forge] ||= {}
        configuration[:forge][name] = options
      end
    end
  end
end
