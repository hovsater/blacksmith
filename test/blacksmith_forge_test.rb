require 'test_helper'

class User
  attr_accessor :name, :admin, :email_address
end

class Post
  attr_accessor :title, :body, :author
end

class UserForge < Blacksmith::Forge
  def user
    make(name: 'John Doe', admin: false) do |user|
      user.email_address = "#{user.name.split.join('.')}@example.com"
    end
  end
  alias_method :member, :user

  def admin
    make(:user, admin: true)
  end
end

class PostForge < Blacksmith::Forge
  def post
    make(title: 'A post',
         body: 'Interesting post.',
         author: forge(:user, User).make(:user))
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

  def test_make_with_dependent_attributes
    forge = UserForge.new(User)
    user = forge.make(:user, name: 'John Doe')

    assert_equal 'John.Doe@example.com', user.email_address
  end

  def test_make_with_invalid_factory
    forge = UserForge.new(User)
    exception = assert_raises RuntimeError do
      forge.make(:unknown)
    end

    assert_equal 'Can not find factory "unknown". Make sure UserForge have ' \
                 'a defined public method for it.',
                 exception.message
  end

  def test_make_with_invalid_attribute
    forge = UserForge.new(User)
    exception = assert_raises RuntimeError do
      forge.make(:user, unknown: true)
    end

    assert_equal 'Can not set "unknown" of User. Make sure User have a ' \
                 'defined setter method for it.',
                 exception.message
  end

  def test_make_with_forge_reference
    forge = PostForge.new(Post)
    post = forge.make(:post)

    assert_instance_of User, post.author
  end

  def test_make_with_invalid_forge_reference
    forge = PostForge.new(Post)
    exception = assert_raises RuntimeError do
      forge.forge(:unknown, User)
    end

    assert_equal 'Can not find forge "UnknownForge". Make sure UnknownForge ' \
                 'exists.',
                 exception.message
  end
end
