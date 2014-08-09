module Swagger
  class DefinitionSection < Hashie::Dash
    include Hashie::Extensions::Coercion

    # @api private
    # @!macro [new] section
    #   @!attribute [rw] $1
    #     $3
    #     @return [$2]
    def self.section(name, type)
      property name
      coerce_key name, type
    end

    # @api private
    # @!macro [new] section
    #   @!attribute [rw] $1
    #     **Required**. $3
    #     @return [$2]
    def self.required_section(name, type)
      property name, required: true
      coerce_key name, type
    end
  end
end
