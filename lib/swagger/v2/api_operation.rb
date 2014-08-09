module Swagger
  module V2
    class APIOperation < DefinitionSection
      required_section :verb, Symbol
      section :summary, String
      section :description, String
      section :operationId, String
      section :produces, Array[String]
      section :consumes, Array[String]
      section :tags, Array[String]
      section :parameters, Array # [ Type? ]
      section :responses, Hash # Type?
      section :schemes, Array[String]

      def self.coerce(orig_hash)
        fail TypeError, 'Can only coerce from a hash' unless orig_hash.is_a? Hash
        top_level_parameters = orig_hash.delete :parameters

        new_hash = {
          verb: orig_hash.keys.first
        }.merge(orig_hash.values.first).merge(parameters: top_level_parameters)

        APIOperation.new(new_hash)
      end

      def to_hash
        base_hash = super
        base_hash.delete :verb
        { verb => base_hash }
      end
    end
  end
end
