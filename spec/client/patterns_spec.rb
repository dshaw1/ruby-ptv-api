require "spec_helper"

RSpec.describe RubyPtv::Patterns do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#pattern" do
    it "returns the stopping pattern of the specified run_id and route_type" do
      VCR.use_cassette("patterns/pattern") do
        response = client.pattern(3347, 0)

        expect(response["departures"].first["run_id"]).to eq(3347)
        expect(response["disruptions"]).to be_empty
      end
    end

    it "errors if no argument is passed" do
      expect { client.pattern }.to raise_error ArgumentError
    end
  end
end
