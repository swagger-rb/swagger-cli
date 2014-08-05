module Swagger
  module Thor
    class Generate < ::Thor::Group
      include ::Thor::Actions

      argument :template
      argument :name

      def self.source_root
        Swagger::Thor::TEMPLATE_DIR
      end

      def copy_base_structure
        directory template, name
      end
    end
  end
end
