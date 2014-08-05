require 'addressable/uri'
require 'addressable/template'
require 'hashie/dash'
require 'hashie/mash'
require 'hashie/extensions/coercion'
require 'hashie/extensions/indifferent_access'

require 'swagger/definition_section'
require 'swagger/uri'
require 'swagger/uri_template'
require 'swagger/loaders'
require 'swagger/api_declaration'
require 'swagger/api_operation'

module Swagger
  class InvalidDefinition < StandardError
    def initialize(errors)
      @errors = errors
      super("The Swagger definition is invalid. The following errors were detected: #{errors.inspect}")
    end
  end

  def self.load(file, loader = nil)
    ext = File.extname file
    loader ||= Swagger::Loaders.loader_for ext
    loader.load File.read(file)
  end
end
