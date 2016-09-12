# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yano/version'

Gem::Specification.new do |spec|
  spec.name          = "yano"
  spec.version       = Yano::VERSION
  spec.authors       = ["Nick Palaniuk"]
  spec.email         = ["npalaniuk@gmail.com"]

  spec.summary       = %q{Parse yes/no like values, useful for CLI prompts}
  spec.description   = %q{Parse yes/no like values}
  spec.homepage      = "https://github.com/nikkypx/yano"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.0"
end
