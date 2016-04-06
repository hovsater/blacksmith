require "test_helper"

class BlacksmithForgeableTest < Minitest::Test
  def test_make
    forgeable = Blacksmith::Forgeable.new(User)

    assert_instance_of User, forgeable.make
  end

  def test_make_with_attributes
    forgeable = Blacksmith::Forgeable.new(User)

    user = forgeable.make(name: "John")

    assert_equal "John", user.name
  end

  def test_prepend
    forgeable_1 = Blacksmith::Forgeable.new(User, -> (user) { user.name = "John" })
    forgeable_2 = Blacksmith::Forgeable.new(User, -> (user) { user.role = :customer })
    forgeable_2.prepend(forgeable_1)

    user = forgeable_2.make

    assert_equal "John", user.name
    assert_equal :customer, user.role
  end
end
