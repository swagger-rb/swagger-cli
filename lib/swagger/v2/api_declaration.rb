require 'json-schema'
require 'swagger/v2/info'

module Swagger
  module V2
    class APIDeclaration < Swagger::APIDeclaration
      property :swagger, required: true
      property :info,    required: true
      coerce_key :info, Info
      property :paths,   required: true
      property :host
      coerce_key :host, Swagger::URITemplate
      property :basePath
      coerce_key :basePath, Swagger::URITemplate
      property :license
      property :schemes
      property :consumes
      property :produces
      property :schemas
      property :definitions
      property :security

      def uri_template
        # FIXME: Can I be safely memoized?
        Addressable::Template.new("#{host}#{basePath}")
      end

      def validate
        errors = JSON::Validator.fully_validate(swagger_schema, to_json)
        fail Swagger::InvalidDefinition, errors unless errors.empty?
        true
      end

      private

      def swagger_schema
        @swagger_schema ||= JSON.parse(File.read('swagger_spec/schemas/v2.0/schema.json'))
      end
    end
  end
end
