require "spec_helper"

RSpec.describe RubyPtv::Search do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#search" do
    it "returns stops, routes and myki ticket outlets that contain the specified search term" do
      VCR.use_cassette("search/search") do
        response = client.search("glen waverley", route_types: 0, include_outlets: false)

        expect(response["routes"].first["route_name"]).to eq("Glen Waverley Line")
      end
    end

    it "errors if no argument is passed" do
      expect { client.search }.to raise_error ArgumentError
    end
  end
end
