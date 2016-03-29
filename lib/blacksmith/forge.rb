module Blacksmith
  class Forge
    DEFAULT_FACTORY = :default

    attr_reader :object_class

    def initialize(object_class)
      @object_class = object_class
    end

    def make(factory = {}, attributes = {})
      if factory.respond_to?(:each)
        make_from_factory(:default, factory)
      else
        make_from_factory(factory, attributes)
      end
    end

    def default
      object_class.new
    end

    private

    def make_from_factory(factory, attributes)
      public_send(:"#{factory}").tap do |object|
        attributes.each do |attribute, value|
          object.public_send(:"#{attribute}=", value)
        end
      end
    end
  end
end
