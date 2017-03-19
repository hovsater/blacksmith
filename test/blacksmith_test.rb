require "test_helper"

class BlacksmithTest < Minitest::Test
  include Blacksmith::Tooling

  CustomUser = Struct.new(:name, :role, :email_address)

  def setup
    @forge = UserForge.new(User)
  end

  def test_make_user
    user = make @forge.default
    assert_user user, "John", :customer, "john@example.com"
  end

  def test_make_user_using_block
    user = make forge(:user) do |user|
      user.name = "Jane"
      user.email_address = "jane@example.com"
    end

    assert_user user, "Jane", :customer, "jane@example.com"
  end

  def test_make_user_with_attributes
    user = make @forge.default, name: "Jane"
    assert_user user, "Jane", :customer, "john@example.com"
  end

  def test_make_list_of_users
    users = make_list @forge.default, 2
    assert_user users[0], "John", :customer, "john@example.com"
    assert_user users[1], "John", :customer, "john@example.com"
  end

  def test_make_list_of_users_with_attributes
    users = make_list @forge.default, 2, name: "Jane"
    assert_equal 2, users.size
    assert_user users[0], "Jane", :customer, "john@example.com"
    assert_user users[1], "Jane", :customer, "john@example.com"
  end

  def test_make_user_via_implicitly_accessed_forge
    user = make forge(:user).default
    assert_user user, "John", :customer, "john@example.com"
  end

  def test_make_user_via_implicitly_accessed_forge_using_custom_creator
    user = make forge(:user, CustomUser)
    assert_instance_of CustomUser, user
    assert_user user, "John", :customer, "john@example.com"
  end

  def test_make_user_via_implicitly_accessed_forge_using_default_factory
    user = make forge(:user)
    assert_user user, "John", :customer, "john@example.com"
  end

  def assert_user(user, name, role, email_address)
    assert_equal name, user.name
    assert_equal role, user.role
    assert_equal email_address, user.email_address
  end
end
