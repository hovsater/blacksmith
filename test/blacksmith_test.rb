require "test_helper"

class BlacksmithTest < Minitest::Test
  def setup
    @forge = UserForge.new(User)
  end

  def test_make_user
    user = @forge.user.make

    assert_equal "John", user.name
    assert_equal :customer, user.role
    assert_equal "John@example.com", user.email_address
  end

  def test_make_admin
    admin = @forge.admin.make

    assert_equal "John", admin.name
    assert_equal :administrator, admin.role
    assert_equal "John@example.com", admin.email_address
  end

  def test_make_admin_override
    admin = @forge.admin.make(email_address: "Administrator@example.com")

    assert_equal "John", admin.name
    assert_equal :administrator, admin.role
    assert_equal "Administrator@example.com", admin.email_address
  end
end
