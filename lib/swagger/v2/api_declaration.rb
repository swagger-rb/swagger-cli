require 'json-schema'
require 'swagger/v2/info'
require 'swagger/v2/api_operation'

module Swagger
  module V2
    SWAGGER_SCHEMA = File.expand_path '../../../../resources/schemas/swagger/v2.0/schema.json', __FILE__
    JSON_SCHEMA = File.expand_path '../../../../resources/schemas/json_schema/draft-04.json', __FILE__

    class APIDeclaration < Swagger::APIDeclaration
      required_section :swagger, Float
      required_section :info, Info
      required_section :paths, Hash[String => APIOperation]
      section :host, Swagger::URITemplate
      section :basePath, Swagger::URITemplate
      section :schemes, Array[String]
      section :consumes, Array[String]
      section :produces, Array[String]
      section :schemas, Hash
      section :definitions, Hash
      section :security, Array

      def uri_template
        # FIXME: Can I be safely memoized?
        Addressable::Template.new("#{host}#{basePath}")
      end

      def fully_validate
        # FIXME: fully_validate is ideal, but very slow with the current schema/validator
        errors = JSON::Validator.fully_validate(swagger_schema, to_json)
        fail Swagger::InvalidDefinition, errors unless errors.empty?
        true
      end

      def validate
        JSON::Validator.validate!(swagger_schema, to_json)
      rescue JSON::Schema::ValidationError => e
        raise Swagger::InvalidDefinition, e.message
      end

      private

      def swagger_schema
        @swagger_schema ||= JSON.parse(File.read(SWAGGER_SCHEMA))

        # Offline workaround
        # @swagger_schema = JSON.parse(File.read(SWAGGER_SCHEMA)
        #   .gsub('http://json-schema.org/draft-04/schema', "file://#{SWAGGER_SCHEMA}"))
        # @swagger_schema['$schema'] = 'http://json-schema.org/draft-04/schema#'
        # @swagger_schema
      end
    end
  end
end
