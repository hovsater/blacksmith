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

    def forge(name)
      if Blacksmith.configuration[:forge].key?(name)
        config = Blacksmith.configuration[:forge][name]
        klass = Object.const_get("#{name.to_s.capitalize}Forge")
        klass.new(config[:entity])
      end
    end
  end
end
