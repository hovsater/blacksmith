require "test_helper"

class BlacksmithForgeableTest < Minitest::Test
  def test_pass_object
    object = User.new
    forgeable = Blacksmith::Forgeable.new(object)
    assert_equal object, forgeable.object
  end

  def test_merge_bang
    forgeable = Blacksmith::Forgeable.new(User.new)
    forgeable.merge! name: "John"
    assert_equal "John", forgeable.object.name
  end

  def test_merge_bang_with_invalid_attribute
    forgeable = Blacksmith::Forgeable.new(User.new)
    assert_raises Blacksmith::InvalidAttribute do
      forgeable.merge! invalid: :attribute
    end
  end
end
