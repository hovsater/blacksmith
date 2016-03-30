module Blacksmith
  class Forge
    DEFAULT_FACTORY = :default

    attr_reader :object_class

    def initialize(object_class)
      @object_class = object_class
    end

    def make(factory = {}, attributes = {}, &block)
      if factory.respond_to?(:each)
        make_from_factory(DEFAULT_FACTORY, factory, &block)
      else
        make_from_factory(factory, attributes, &block)
      end
    end

    def default
      object_class.new
    end

    private

    def factory(name)
      public_send(:"#{name}")
    end

    def make_from_factory(name, attributes, &block)
      factory(name).tap do |object|
        attributes.each do |attribute, value|
          object.public_send(:"#{attribute}=", value)
        end

        block.call(object) if block_given?
      end
    end
  end
end
