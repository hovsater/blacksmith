require "ostruct"

module Blacksmith
  class Forge
    def initialize(creator)
      @creator = creator
    end

    private

    def forgeable
      Forgeable.new(@creator.new).tap do |forgeable|
        yield forgeable.object if block_given?
      end
    end
  end
end
