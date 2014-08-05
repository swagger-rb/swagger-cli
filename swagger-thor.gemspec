# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swagger/thor/version'

Gem::Specification.new do |spec|
  spec.name          = 'swagger-thor'
  spec.version       = Swagger::Thor::VERSION
  spec.authors       = ['Max Lincoln']
  spec.email         = ['max@devopsy.com']
  spec.summary       = 'TODO: Write a short summary. Required.'
  spec.description   = 'TODO: Write a longer description. Optional.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'addressable', '~> 2.3'
  spec.add_dependency 'hashie', '~> 3.0'
  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'json-schema', '~> 2.2'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
