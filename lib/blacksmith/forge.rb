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
      fail_with_invalid_factory(name) unless respond_to?(name)
      public_send(:"#{name}")
    end

    def make_from_factory(name, attributes, &block)
      factory(name).tap do |object|
        attributes.each do |attribute, value|
          unless object.respond_to?(:"#{attribute}=")
            fail_with_invalid_object_attribute(attribute)
          end
          object.public_send(:"#{attribute}=", value)
        end

        block.call(object) if block_given?
      end
    end

    def fail_with_invalid_factory(name)
      fail "Can not find factory \"#{name}\". Make sure #{self.class.name} " \
           "have a defined public method for it."
    end

    def fail_with_invalid_object_attribute(attribute)
      fail "Can not set \"#{attribute}\" of #{object_class.name}. Make sure " \
           "#{object_class.name} have a defined setter method for it."
    end
  end
end
