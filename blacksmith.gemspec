# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blacksmith/version'

Gem::Specification.new do |spec|
  spec.name          = 'blacksmith'
  spec.version       = Blacksmith::VERSION
  spec.authors       = ['Kevin Sjöberg']
  spec.email         = ['kev.sjoberg@gmail.com']
  spec.summary       = %q(Blacksmith allows you to forge factories with plain
                          Ruby.)
  spec.description   = %q(Blacksmith allows you to forge factories with plain
                          Ruby. No DSL to learn, no magic, just Plain Old Ruby
                          Objects.)
  spec.homepage      = 'https://github.com/KevinSjoberg/blacksmith'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
