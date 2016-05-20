require "test_helper"

class BlacksmithTest < Minitest::Test
  include Blacksmith::Tooling

  def setup
    @forge = UserForge.new(User)
  end

  def test_build_user
    user = @forge.user

    assert_equal "John", user.name
    assert_equal :customer, user.role
    assert_equal "john@example.com", user.email_address
  end

  def test_build_user_with_custom_attributes
    user = make(@forge.user, name: "Jane")

    assert_equal "Jane", user.name
    assert_equal :customer, user.role
    assert_equal "john@example.com", user.email_address
  end
end
