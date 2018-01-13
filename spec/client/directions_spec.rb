require "spec_helper"

RSpec.describe RubyPtv::Directions do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#direction" do
    it "raises an argument error if no arguments are passed" do
      expect { client.direction }
        .to raise_error(ArgumentError)
    end

    it "returns all routes for a specified direction" do
      VCR.use_cassette("directions/direction") do
        response = client.direction(9)

        # expect(response).to be_a(Hashie::Mash)
        expect(response.first["direction_name"]).to eq("Lilydale")
        assert_requested :get, base_url("/v3/directions/9?devid=#{ENV['DEV_ID']}&signature=4CD2FA2A892B04D22E5EEE28BC1A10DB388E85AA")
      end
    end

    it "errors if no argument is passed" do
      expect { client.direction }.to raise_error ArgumentError
    end
  end

  describe "#directions_for_route" do
    it "returns all directions that a specified route travels in" do
      VCR.use_cassette("directions/directions_for_route") do
        response = client.directions_for_route(1)

        expect(response.first["direction_name"]).to eq("Alamein")
      end
    end
  end

  describe "#directions_for_route_type" do
    it "returns all routes of a specified route type that travel in a specified direction" do
      VCR.use_cassette("directions/directions_for_route_type") do
        response = client.directions_for_route_type(4, 0)

        expect(response.first["direction_id"]).to eq(4)
        expect(response.first["route_type"]).to eq(0)
      end
    end
  end
end
