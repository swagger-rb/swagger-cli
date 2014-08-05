require 'swagger/thor/generate'

module Swagger
  module Thor
    class CLI < ::Thor
      namespace :swagger
      # register(Swagger::Thor::Generate, "generate", "generate", "Generates a project")
    end
  end
end
