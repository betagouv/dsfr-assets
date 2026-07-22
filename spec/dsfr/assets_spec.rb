# frozen_string_literal: true

RSpec.describe Dsfr::Assets do
  it "has a version number" do
    expect(described_class::VERSION).not_to be_nil
  end

  it "has a CGU version" do
    expect(described_class::CGU_VERSION).not_to be_nil
  end

  describe ".license_accepted?" do
    before { described_class.accept_license = nil }
    after  { described_class.accept_license = nil }

    it "returns false when nothing is configured" do
      expect(described_class.license_accepted?).to be false
    end

    it "returns true when the correct CGU version is set" do
      described_class.accept_license = described_class::CGU_VERSION
      expect(described_class.license_accepted?).to be true
    end

    it "returns false when an outdated CGU version is set" do
      described_class.accept_license = "0.0.1"
      expect(described_class.license_accepted?).to be false
    end

    context "with DSFR_ACCEPT_LICENSE=1" do
      around do |example|
        ENV["DSFR_ACCEPT_LICENSE"] = "1"
        example.run
      ensure
        ENV.delete("DSFR_ACCEPT_LICENSE")
      end

      it "returns true regardless of accept_license" do
        expect(described_class.license_accepted?).to be true
      end
    end
  end

  describe ".check_license!" do
    before { described_class.accept_license = nil }
    after  { described_class.accept_license = nil }

    it "raises LicenseError when license is not accepted" do
      expect { described_class.check_license! }.to raise_error(described_class::LicenseError, /modalités d'utilisation/)
    end

    it "raises LicenseError with version mismatch details" do
      described_class.accept_license = "0.0.1"
      expect { described_class.check_license! }.to raise_error(described_class::LicenseError, /ne correspond pas/)
    end

    it "does not raise when the correct CGU version is set" do
      described_class.accept_license = described_class::CGU_VERSION
      expect { described_class.check_license! }.not_to raise_error
    end
  end
end
