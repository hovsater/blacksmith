module Blacksmith
  class Forgeable
    attr_reader :blocks

    def initialize(klass, block = -> (user) {})
      @klass = klass
      @blocks = [block]
    end

    def make(attributes = {})
      @klass.new.tap do |i|
        @blocks.each { |b| b.call(i) }
        attributes.each { |a, v| i.send(:"#{a}=", v) }
      end
    end

    def prepend(forgeable)
      @blocks.unshift(*forgeable.blocks)
    end
  end
end
