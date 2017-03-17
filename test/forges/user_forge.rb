class UserForge
  attr_reader :creator

  private :creator

  def initialize(creator = User)
    @creator = creator
  end

  def user
    creator.new.tap do |user|
      user.name = "John"
      user.role = :customer
      user.email_address = "john@example.com"
    end
  end
end