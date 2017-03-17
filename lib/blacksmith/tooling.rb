require_relative "tools/forge"
require_relative "tools/make"

module Blacksmith
  module Tooling
    def forge(name)
      Tools::Forge.new.perform(name)
    end

    def make(object, attributes)
      Tools::Make.new.perform(object, attributes)
    end

    def make_list(object, size, attributes = {})
      size.times.map { make(object, attributes) }
    end
  end
end
