require_relative "tools/make"

module Blacksmith
  module Tooling
    def make(object, attributes)
      Tools::Make.new.perform(object, attributes)
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
