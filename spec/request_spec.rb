require "spec_helper"

RSpec.describe RubyPtv::Request do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "default attributes" do
    it "should include httparty methods" do
      expect(RubyPtv::Request).to include HTTParty
    end
  end

  describe "#request" do
    it "errors if no argument is passed" do
      expect { client.request }.to raise_error ArgumentError
    end
  end

  describe "#parse" do
    it "errors if no argument is passed" do
      expect { client.parse }.to raise_error ArgumentError
    end
  end
end
