module Blacksmith
  class Forgeable
    attr_reader :object

    def initialize(object)
      @object = object
    end

    def merge!(attributes = {})
      tap do
        attributes.each do |key, value|
          setter = :"#{key}="
          raise InvalidAttribute.new(key) unless object.respond_to?(setter)
          object.public_send(setter, value)
        end
      end
    end
  end
end
