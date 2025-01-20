# frozen_string_literal: true

require_relative "assets/version"

module Dsfr
  module Assets
    class Engine < ::Rails::Railtie
      initializer "dsfr-assets.paths" do |app|
        app.config.assets.paths << File.expand_path("../../vendor/assets/stylesheets", __dir__)
        app.config.assets.paths << File.expand_path("../../vendor/assets/javascripts", __dir__)
      end
    end
  end
end
