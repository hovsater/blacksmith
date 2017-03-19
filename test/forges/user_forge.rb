class UserForge < Blacksmith::Forge
  def initialize(creator = User)
    super(creator)
  end

  def default
    forgeable do |f|
      f.name = "John"
      f.role = :customer
      f.email_address = "#{f.name.downcase}@example.com"
    end
  end
end
