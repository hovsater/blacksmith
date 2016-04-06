$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require "blacksmith"
require "minitest/autorun"

Dir[File.expand_path("../fixtures/*.rb", __FILE__)].each { |f| require f }
Dir[File.expand_path("../forges/*_forge.rb", __FILE__)].each { |f| require f }
