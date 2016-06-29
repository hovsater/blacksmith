module Blacksmith
  module Tools
    class Make
      def perform(object, attributes)
        attributes.each_with_object(object) do |(attribute, value), obj|
          ensure_attribute_exists!(object, attribute)
          obj.public_send(:"#{attribute}=", value)
        end
      end

      private

      def ensure_attribute_exists!(object, attribute)
        setter_exists = object.respond_to?(:"#{attribute}=")

        raise InvalidAttribute,
              "There is no setter defined on `#{object.class.name}` for " \
              "the attribute `#{attribute}`." unless setter_exists
      end
    end
  end
end
