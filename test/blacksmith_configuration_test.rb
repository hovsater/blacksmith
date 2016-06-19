require "test_helper"

class BlacksmithConfigurationTest < Minitest::Test
  def test_access
    assert_instance_of Blacksmith::Configuration, Blacksmith.configuration
  end

  def test_configure_forge
    Blacksmith.configure do |config|
      config.forge :user, entity: User
    end

    assert_equal User, Blacksmith.configuration[:forge][:user][:entity]
  end
end
