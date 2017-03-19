module Blacksmith
  module Tools
    class Make
      def perform(forgeable, attributes = {})
        forgeable = forgeable.is_a?(Blacksmith::Forge) ? forgeable.default : forgeable
        forgeable.merge!(attributes).object.tap do |object|
          yield object if block_given?
        end
      end
    end
  end
end
