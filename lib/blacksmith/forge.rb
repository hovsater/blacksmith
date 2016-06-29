module Blacksmith
  class Forge
    def initialize(klass)
      @klass = klass
    end

    private

    def object
      @klass.new
    end
  end
end
