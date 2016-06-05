require "blacksmith"

class UserForge < Blacksmith::Forge
  def user
    object.tap do |user|
      user.name = 'John'
      user.role = :customer
      user.email_address = 'john@example.com'
    end
  end
end
