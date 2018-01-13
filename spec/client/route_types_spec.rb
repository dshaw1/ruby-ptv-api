require "spec_helper"

RSpec.describe RubyPtv::RouteTypes do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#route_types" do
    it "returns all route types and their name" do
      VCR.use_cassette("route_types/route_types") do
        response = client.route_types

        expect(response.first["route_type_name"]).to eq("Train")
        assert_requested :get, base_url("/v3/route_types?devid=#{ENV['DEV_ID']}&signature=F8AA3EA6DEF7CC715045B5CF0F80C32A8DC1D62A")
      end
    end
  end
end
