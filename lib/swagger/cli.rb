require 'thor'
require 'swagger'
require 'swagger/cli/version'
require 'swagger/cli/generate'
# require 'swagger/cli/convert'

module Swagger
  module CLI
    RESOURCES_DIR = File.expand_path '../../../resources/', __FILE__
    TEMPLATE_DIR = File.expand_path 'templates/', RESOURCES_DIR

    class Main < Thor
      namespace :swagger
      register(Swagger::CLI::Generate, 'generate', 'generate', 'Generate a project from Swagger')
      # Future actions?
      # register(Swagger::CLI::Convert, 'convert', 'convert', 'Convert from Swagger 1.2 to 2.0')
      # register(Swagger::CLI::Convert, 'call', 'call', 'Call a Swagger API')
    end
  end
end
