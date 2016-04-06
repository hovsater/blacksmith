class UserForge
  include Blacksmith::Tooling

  def initialize(klass)
    @klass = klass
  end

  def user
    forgeable do |user|
      user.name = "John"
      user.role = :customer
      user.email_address = "#{user.name}@example.com"
    end
  end

  def admin
    forgeable(user) do |user|
      user.role = :administrator
    end
  end
end
