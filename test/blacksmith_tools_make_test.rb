require "test_helper"

class BlacksmithToolsMakeTest < Minitest::Test
  def test_make_with_undefined_setter
    make = Blacksmith::Tools::Make.new

    error = assert_raises Blacksmith::InvalidAttribute do
      make.perform(User.new, unknown_attribute: true)
    end

    assert_equal "There is no setter defined on `User` for the attribute " \
                 "`unknown_attribute`.",
                 error.message
  end
end
