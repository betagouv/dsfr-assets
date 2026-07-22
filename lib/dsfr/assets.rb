# frozen_string_literal: true

require_relative "assets/version"

module Dsfr
  # :nodoc:
  module Assets
    class LicenseError < StandardError; end

    class << self
      attr_writer :accept_license

      def license_accepted?
        ENV["DSFR_ACCEPT_LICENSE"] == "1" || @accept_license == CGU_VERSION
      end

      def cgu_url
        "https://github.com/GouvernementFR/dsfr/blob/v#{VERSION}/doc/legal/cgu.md"
      end

      def check_license!
        return if license_accepted?

        raise LicenseError, missing_license_message if @accept_license.nil?

        raise LicenseError, outdated_license_message
      end

      private

      def missing_license_message
        <<~MSG
          [DSFR] Vous devez accepter les modalités d'utilisation du DSFR (v#{CGU_VERSION}).
          Lisez-les ici : #{cgu_url}
          Puis ajoutez dans un initializer Rails :
            Dsfr::Assets.accept_license = "#{CGU_VERSION}"
          Ou définissez la variable d'environnement DSFR_ACCEPT_LICENSE=1.
        MSG
      end

      def outdated_license_message
        <<~MSG
          [DSFR] La version des modalités d'utilisation acceptée ("#{@accept_license}") ne correspond pas
          à la version requise ("#{CGU_VERSION}").
          Lisez la nouvelle version ici : #{cgu_url}
          Puis mettez à jour votre initializer :
            Dsfr::Assets.accept_license = "#{CGU_VERSION}"
        MSG
      end
    end
  end
end

require_relative "assets/railtie" if defined?(Rails::Railtie)
