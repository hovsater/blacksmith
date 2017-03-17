require "test_helper"

class BlacksmithToolsForgeTest < Minitest::Test
  def test_reference_unknown_forge
    forge = Blacksmith::Tools::Forge.new
    error = assert_raises(NameError) { forge.perform(:unknown) }
    assert_equal "uninitialized constant UnknownForge", error.message
  end

  def test_reference_existing_forge
    forge = Blacksmith::Tools::Forge.new
    assert_instance_of UserForge, forge.perform(:user)
  end
end
