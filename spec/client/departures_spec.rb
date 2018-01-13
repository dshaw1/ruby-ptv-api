require "spec_helper"

RSpec.describe RubyPtv::Departures do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#departures" do
    it "raises an argument error if no arguments are passed" do
      expect { client.departures }
        .to raise_error(ArgumentError)
    end

    it "returns all departures for a specified stop" do
      VCR.use_cassette("departures/departures") do
        response = client.departures(0, 1023)

        expect(response["departures"].first["stop_id"]).to eq(1023)
        assert_requested :get, base_url("/v3/departures/route_type/0/stop/1023?devid=#{ENV['DEV_ID']}&signature=C77D3ECBBF7CDB1CB8AC2585DA3A7B1235B699E8")
      end
    end

    it "returns all departures for a specified stop with optional params" do
      VCR.use_cassette("departures/departures_with_optional_params") do
        response = client.departures(0, 1023, direction_id: 1, max_results: 3)

        expect(response["departures"]).not_to be_empty
        expect(response["departures"].length).to eq(3)
      end
    end

    it "errors if no argument is passed" do
      expect { client.departures }.to raise_error ArgumentError
    end
  end

  describe "#departures_for_route" do
    it "raises an argument error if no arguments are passed" do
      expect { client.departures_for_route }
        .to raise_error(ArgumentError)
    end

    it "returns all departures for a specified stop and route" do
      VCR.use_cassette("departures/departures_for_route") do
        response = client.departures_for_route(0, 1127, 14)

        expect(response["departures"].first["route_id"]).to eq(14)
      end
    end
  end
end
