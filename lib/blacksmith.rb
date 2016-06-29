require 'blacksmith/version'
require 'blacksmith/forge'
require 'blacksmith/errors'
require 'blacksmith/tooling'
require 'blacksmith/configuration'

module Blacksmith
  def self.configure
    yield configuration.builder
  end

  def self.configuration
    @configuration ||= Configuration.new({})
  end
end
