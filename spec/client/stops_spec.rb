require "spec_helper"

RSpec.describe RubyPtv::Stops do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#stop" do
    it "returns the stop location and other information for the specific stop" do
      VCR.use_cassette("stops/stop") do
        response = client.stop(1013, 0, stop_location: true)

        expect(response["station_type"]).to eq("Premium Station")
      end
    end

    it "errors if no argument is passed" do
      expect { client.stop }.to raise_error ArgumentError
    end
  end

  describe "#stops_for_route" do
    it "returns all stops for the specified route" do
      VCR.use_cassette("stops/stops_for_route") do
        response = client.stops_for_route(7, 0)

        expect(response.last["stop_name"]).to eq("Tooronga Station")
      end
    end
  end

  describe "#stops_for_location" do
    it "returns all stops for the specified location" do
      VCR.use_cassette("stops/stops_for_location") do
        response = client.stops_for_location("-37.87623", "145.14978")

        expect(response.first["stop_id"]).to eq(1190)
      end
    end
  end
end
