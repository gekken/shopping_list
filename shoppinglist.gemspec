# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shoppinglist/version'

Gem::Specification.new do |spec|
  spec.name          = 'shoppinglist'
  spec.version       = ShoppingList::VERSION
  spec.authors       = %w(Peter Bomars)
  spec.email         = %w(pbomars@gmail.com)
  spec.description   = %q{Simple shopping list gem}
  spec.summary       = %q{A simple gem that allows the user to create shopping lists, storing them in ~/Dropbox/ShoppingList by default.}
  spec.homepage      = 'https://github.com/gekken/shopping_list'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
