# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gemuse/version'

Gem::Specification.new do |spec|
  spec.name          = "gemuse"
  spec.version       = Gemuse::VERSION
  spec.authors       = ["anoiaque"]
  spec.email         = ["anoiaque@gmail.com"]
  spec.summary       = %q{Find unused gem in Gemfile}
  spec.description   = %q{Find unused gem in Gemfile}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "colorize"
end
