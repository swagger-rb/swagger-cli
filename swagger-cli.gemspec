# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swagger/cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'swagger-cli'
  spec.version       = Swagger::CLI::VERSION
  spec.authors       = ['Max Lincoln']
  spec.email         = ['max@devopsy.com']
  spec.summary       = 'Swagger generators'
  spec.description   = 'Generates for Swagger APIs, using Thor.'
  spec.homepage      = 'http://swagger.io/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'swagger-core', '~> 0.2'
  spec.add_dependency 'thor', '~> 0.19'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'polytrix'
end
