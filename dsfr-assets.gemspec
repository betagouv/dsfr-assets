# frozen_string_literal: true

require_relative "lib/dsfr/assets/version"

Gem::Specification.new do |spec|
  spec.name = "dsfr-assets"
  spec.version = Dsfr::Assets::VERSION
  spec.authors = ["Stéphane Maniaci"]
  spec.email = ["stephane.maniaci@beta.gouv.fr"]

  spec.summary = "The static CSS/JS/images assets for the French design system (DSFR)"
  spec.description = "This gem bundles the static assets of the DSFR so you can just pull in the gem."
  spec.homepage = "https://github.com/betagouv/dsfr-assets"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
