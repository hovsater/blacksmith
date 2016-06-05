module Blacksmith
  module Tooling
    def make(object, attributes)
      attributes.each_with_object(object) do |(attribute, value), obj|
        obj.public_send(:"#{attribute}=", value)
      end
    end

    def make_list(object, size, attributes = {})
      size.times.map { make(object, attributes) }
    end
  end
end
