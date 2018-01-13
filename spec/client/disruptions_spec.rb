require "spec_helper"

RSpec.describe RubyPtv::Disruptions do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#disruptions" do
    it "returns all disruptions" do
      VCR.use_cassette("disruptions/disruptions") do
        response = client.disruptions

        expect(response).not_to be_empty
        assert_requested :get, base_url("/v3/disruptions?devid=#{ENV['DEV_ID']}&signature=1C060B2512306164B673559A38103974EBC8FAC1")
      end
    end
  end

  describe "#disruptions_for_route" do
    it "returns all disruptions for a specified route" do
      VCR.use_cassette("disruptions/disruptions_for_route") do
        response = client.disruptions_for_route(1, disruption_status: "current")

        expect(response["general"]).to be_empty
        expect(response["metro_train"].first["disruption_id"]).to eq(117203)
      end
    end

    it "errors if no argument is passed" do
      expect { client.disruptions_for_route }.to raise_error ArgumentError
    end
  end

  describe "#disruption" do
    it "returns the specified disruption" do
      VCR.use_cassette("disruptions/disruption") do
        response = client.disruption(116573)

        expect(response["disruption_id"]).to eq(116573)
      end
    end
  end
end
