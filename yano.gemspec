# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yano/version'

Gem::Specification.new do |spec|
  spec.name          = 'yano'
  spec.version       = Yano::VERSION
  spec.authors       = ['Nick Palaniuk']
  spec.email         = ['npalaniuk@gmail.com']

  spec.summary       = 'Parse yes/no like values, useful for CLI prompts'
  spec.description   = 'Parse yes/no like values'
  spec.homepage      = 'https://github.com/nikkypx/yano'
  spec.required_ruby_version = '>= 2.4.0'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
end
