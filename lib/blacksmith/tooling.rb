module Blacksmith
  module Tooling
    def make(object, attributes)
      attributes.each_with_object(object) do |(attribute, value), object|
        object.public_send(:"#{attribute}=", value)
      end
    end
  end
end
