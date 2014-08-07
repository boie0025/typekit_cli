# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'typekit_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "typekit_cli"
  spec.version       = TypekitCLI::VERSION
  spec.authors       = ["Nic Boie"]
  spec.email         = ["boie0025@gmail.com"]
  spec.description   = "Provide CLI interface to query kits"
  spec.summary       = "This gem provides a cli interface to lookup kits on Typekit, and their respective information."
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
