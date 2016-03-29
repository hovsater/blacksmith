require 'test_helper'

class User
  attr_accessor :name, :admin
end

class UserForge < Blacksmith::Forge
  def user
    make(name: 'John Doe', admin: false)
  end
  alias_method :member, :user

  def admin
    make(:user, admin: true)
  end
end

class BlacksmithForgeTest < Minitest::Test
  def test_make
    forge = UserForge.new(User)
    user = forge.make

    assert_instance_of User, user
  end

  def test_make_from_factory
    forge = UserForge.new(User)
    user = forge.make(:user)

    assert_equal false, user.admin
    assert_equal 'John Doe', user.name
  end

  def test_make_from_alias_factory
    forge = UserForge.new(User)
    user = forge.make(:member)

    assert_equal false, user.admin
    assert_equal 'John Doe', user.name
  end

  def test_make_from_factory_with_attributes
    forge = UserForge.new(User)
    user = forge.make(:admin)

    assert_equal true, user.admin
  end

  def test_make_from_attributes
    forge = UserForge.new(User)
    user = forge.make(name: 'John Doe')

    assert_equal 'John Doe', user.name
  end
end
