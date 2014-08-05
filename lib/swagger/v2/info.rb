module Swagger
  module V2
    class Info < DefinitionSection
      class Contact < DefinitionSection
        property :name
        property :url
        coerce_key :url, Swagger::URI
        property :email
      end

      class License < DefinitionSection
        property :name
        property :url
        coerce_key :url, Swagger::URI
      end

      property :version, required: true
      property :title, required: true
      property :description
      property :termsOfService
      property :contact
      coerce_key :contact, Contact
      property :license
      coerce_key :license, License
    end
  end
end
