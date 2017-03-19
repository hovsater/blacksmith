# Blacksmith

Blacksmith is a fixtures replacement that allows you to easily and programmatically forge test objects. An alternative to [factory_girl](https://github.com/thoughtbot/factory_girl).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'blacksmith'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blacksmith

## Usage

Blacksmith provides you with the concept of forges. A forge is basically a Ruby
class with factory definitions in it.

```ruby
class UserForge < Blacksmith::Forge
  def default
    forgeable do |user|
      user.first_name = "John"
      user.last_name = "Doe"
      user.email_address = "john.doe@example.com"
    end
  end
end
```

Let's use this in a test!

```ruby
class UserTest < Minitest::Test
  include Blacksmith::Tooling

  def test_full_name
    forge = UserForge.new(User)
    user = make forge.default
    assert_equal "John Doe", user.full_name
  end
end
```

This might seem like a lot of boilerplate just to get a test passing. Fortunately, this can be rewritten like so:

Let's add a default creator to our `UserForge`.

```ruby
class UserForge < Blacksmith::Forge
  def initialize(creator = User)
    super(creator)
  end

  def default
    forgeable do |user|
      user.first_name = "John"
      user.last_name = "Doe"
      user.email_address = "john.doe@example.com"
    end
  end
end
```

Now let's rewrite the test.

```ruby
class UserTest < Minitest::Test
  include Blacksmith::Tooling

  def test_full_name
    user = make forge(:user)
    assert_equal "John Doe", user.full_name
  end
end
```

There are a number of things going on. `forge` allow us to implicitly reference
our `UserForge`. Since we added a default creator to our `UserForge` we don't
have to provide one. By default, `forge` will call the `default` factory if we
don't provide another one.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/KevinSjoberg/blacksmith. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
