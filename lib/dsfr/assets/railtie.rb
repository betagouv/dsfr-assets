# frozen_string_literal: true

module Dsfr
  module Assets
    # exposes the assets to the Rails app
    class Engine < ::Rails::Railtie
      initializer "dsfr-assets.paths" do |app|
        app.config.assets.paths << File.expand_path("../../../vendor/assets/stylesheets", __dir__)
        app.config.assets.paths << File.expand_path("../../../vendor/assets/javascripts", __dir__)
      end
    end
  end
end
