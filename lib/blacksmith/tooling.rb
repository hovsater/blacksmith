module Blacksmith
  module Tooling
    private

    def forgeable(forgeable = nil, &block)
      new_forgeable = Forgeable.new(@klass, block)
      new_forgeable.prepend(forgeable) if forgeable
      new_forgeable
    end
  end
end
