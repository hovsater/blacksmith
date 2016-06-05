module Blacksmith
  class Forge
    attr_accessor :klass

    def initialize(klass)
      @klass = klass
    end

    private

    def object
      klass.new
    end
  end
end
