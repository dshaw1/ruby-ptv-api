require "spec_helper"

RSpec.describe RubyPtv do
  describe "default attributes" do
    it "has a version number" do
      expect(RubyPtv::VERSION).not_to be nil
    end
  end

  describe ".configure" do
    it "should set the global configuration options" do
      config = RubyPtv.configure(dev_id: "1234", secret_key: "111-222-333")
      expect(config).to be_a(Hash)
    end

    it "should raise an ArgumentError if no options are provided" do
      expect { RubyPtv.configure(nil) }
        .to raise_error(ArgumentError)
    end
  end

  describe ".configuration" do
    before do
      RubyPtv.configure(dev_id: "1234", secret_key: "111-222-333")
    end

    it "should return global configuration hash with a dev_id and secret_key" do
      config = RubyPtv.configuration
      expect(config).to be_a(Hash)
      expect(config).to have_key(:dev_id)
      expect(config).to have_key(:secret_key)
      expect(config[:dev_id]).to eq("1234")
      expect(config[:secret_key]).to eq("111-222-333")
    end
  end

  describe ".reset_configuration" do
    before do
      RubyPtv.configure(dev_id: "1234", secret_key: "111-222-333")
    end

    it "should reset the global configuration" do
      RubyPtv.reset_configuration
      expect(RubyPtv.configuration).to be_empty
    end
  end
end
