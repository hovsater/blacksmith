require_relative "tools/forge"
require_relative "tools/make"

module Blacksmith
  module Tooling
    def forge(name, creator = nil)
      Tools::Forge.new.perform(name, creator)
    end

    def make(object, attributes = {}, &block)
      Tools::Make.new.perform(object, attributes, &block)
    end

    def make_list(object, size, attributes = {})
      size.times.map { make(object, attributes) }
    end
  end
end
