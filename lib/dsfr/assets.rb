# frozen_string_literal: true

require_relative "assets/version"

module Dsfr
  # :nodoc:
  module Assets
    class LicenseError < StandardError; end

    class << self
      attr_writer :accepted_license_version

      def cgu_url
        "https://github.com/GouvernementFR/dsfr/blob/v#{VERSION}/doc/legal/cgu.md"
      end

      def check_license!
        return if license_env_bypass?

        if @accepted_license_version.nil?
          raise LicenseError, missing_license_message
        elsif @accepted_license_version != CGU_VERSION
          raise LicenseError, license_version_mismatch_message(@accepted_license_version)
        end
      end

      private

      def license_env_bypass?
        ENV["DSFR_ACCEPT_LICENSE"] == "1"
      end

      def missing_license_message
        <<~MSG

          [dsfr-assets] Vous devez accepter les modalités
          d'utilisation du DSFR (v#{CGU_VERSION}).

          Lisez-les ici :

          #{cgu_url}

          Puis ajoutez dans un initializer Rails :
            Dsfr::Assets.accepted_license_version = "#{CGU_VERSION}"
        MSG
      end

      def license_version_mismatch_message(version)
        <<~MSG

          [DSFR] La version des modalités d'utilisation acceptée
          ("#{version}") ne correspond pas à la
          version requise ("#{CGU_VERSION}").

          Lisez la nouvelle version ici :

          #{cgu_url}

          Puis mettez à jour votre initializer :
            Dsfr::Assets.accepted_license_version = "#{CGU_VERSION}"
        MSG
      end
    end
  end
end

require_relative "assets/railtie" if defined?(Rails::Railtie)
