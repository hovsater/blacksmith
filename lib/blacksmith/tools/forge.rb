module Blacksmith
  module Tools
    class Forge
      def perform(name, creator)
        forge = canonicalize_constant(name)
        creator ? forge.new(creator) : forge.new
      end

      private

      def canonicalize_constant(name)
        class_name = "#{underscore_to_camelcase(name)}Forge"
        Object.const_get(class_name)
      end

      def underscore_to_camelcase(name)
        name.to_s.downcase.split(/_/).map(&:capitalize).join
      end
    end
  end
end
