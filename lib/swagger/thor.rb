require 'thor'
require 'swagger'
require 'swagger/thor/version'
require 'swagger/thor/cli'

module Swagger
  module Thor
    TEMPLATE_DIR = File.expand_path('../../../templates', __FILE__)
  end
end
