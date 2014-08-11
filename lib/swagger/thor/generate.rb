require 'swagger/thor/actions'

module Swagger
  module Thor
    class Generate < ::Thor::Group
      include ::Thor::Actions
      include Swagger::Thor::Actions

      argument :framework
      argument :name
      class_option :swagger_file, default: 'swagger.json'

      def self.source_root
        Swagger::Thor::TEMPLATE_DIR
      end

      def add_framework_to_source_root
        source_paths.map do | path |
          path << "/#{framework}"
        end
      end

      def set_destination_root
        self.destination_root = name
      end

      def parse_swagger_file
        @swagger = Swagger.load options[:swagger_file]
      end

      def copy_base_structure
        directory 'files', '.'
      end

      def bundle
        Bundler.with_clean_env do
          inside destination_root do
            run 'bundle install' if File.exist?('Gemfile')
          end
        end
      end
    end
  end
end
