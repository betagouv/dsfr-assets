# frozen_string_literal: true

RSpec.describe Dsfr::Assets do
  it "has a version number" do
    expect(described_class::VERSION).not_to be_nil
  end

  it "has a CGU version" do
    expect(described_class::CGU_VERSION).not_to be_nil
  end

  describe "check_license!" do
    before { described_class.accepted_license_version = nil }

    context "when the correct version has been accepted" do
      before do
        described_class.accepted_license_version = described_class::CGU_VERSION
      end

      it "does not raise" do
        expect { described_class.check_license! }.not_to raise_error
      end
    end

    context "when the accepted license version hasn't been set" do
      before { described_class.accepted_license_version = nil }

      it "raises a LicenceError" do
        expect { described_class.check_license! }
          .to raise_error(Dsfr::Assets::LicenseError, /accepter les modalités/)
      end
    end

    context "when the accepted license version doesn't match the current one" do
      before { described_class.accepted_license_version = "foobar" }

      it "raises a LicenseError" do
        expect { described_class.check_license! }
          .to raise_error(described_class::LicenseError, /ne correspond pas/)
      end
    end

    context "when the ENV bypass is used" do
      before do
        allow(ENV).to receive(:[]).with("DSFR_ACCEPT_LICENSE").and_return "1"
      end

      it "does not raise" do
        expect { described_class.check_license! }.not_to raise_error
      end
    end
  end
end
