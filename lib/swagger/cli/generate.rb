require 'swagger/cli/actions'

module Swagger
  module CLI
    class Generate < Thor::Group
      namespace :generate
      include Thor::Actions
      include Swagger::CLI::Actions

      argument :framework
      argument :name
      class_option :swagger_file, default: 'swagger.json'
      class_option :stub, type: :boolean, default: false, desc: 'Stub services with examples from Swagger'

      def self.source_root
        Swagger::CLI::TEMPLATE_DIR
      end

      def add_framework_to_source_root
        @framework_path = Dir[File.expand_path(framework, Dir.pwd), File.expand_path(framework, Swagger::CLI::TEMPLATE_DIR)].first
        abort "Template #{framework} not found in local directory or built-in templates" unless @framework_path
        # Hack... but I don't know why I can't pick a source_root based on arguments
        source_paths.map do |path|
          path.gsub!(/\A.*\Z/, @framework_path)
        end
      end

      def set_destination_root
        self.destination_root = name
      end

      def load_helpers
        Dir["#{@framework_path}/helpers/**/*.rb"].each do |helper|
          load helper
        end
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
