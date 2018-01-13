require "spec_helper"

RSpec.describe RubyPtv::Routes do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#routes" do
    it "returns route details of all route types" do
      VCR.use_cassette("routes/routes") do
        response = client.routes

        expect(response.last["route_id"]).to eq(11548)
        assert_requested :get, base_url("/v3/routes?devid=#{ENV['DEV_ID']}&signature=E7D472426245EA412760EE6B360B796BE6869A6E")
      end
    end
  end

  describe "#route" do
    it "returns route details of the specified route" do
      VCR.use_cassette("routes/route") do
        response = client.route(2)

        expect(response["route_id"]).to eq(2)
      end
    end

    it "errors if no argument is passed" do
      expect { client.route }.to raise_error ArgumentError
    end
  end
end
