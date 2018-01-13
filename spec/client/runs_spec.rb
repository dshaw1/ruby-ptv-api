require "spec_helper"

RSpec.describe RubyPtv::Runs do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#runs_for_route_id" do
    it "returns all runs for the specified route ID" do
      VCR.use_cassette("runs/runs_for_route_id") do
        response = client.runs_for_route_id(11548)

        expect(response.first["route_type"]).to eq(4)
      end
    end

    it "errors if no argument is passed" do
      expect { client.runs_for_route_id }.to raise_error ArgumentError
    end
  end

  describe "#runs_for_route_id_and_type" do
    it "returns all runs for the specified route ID and route type" do
      VCR.use_cassette("runs/runs_for_route_id_and_type") do
        response = client.runs_for_route_id_and_type(11548, 4)

        expect(response.first["run_id"]).to eq(10)
      end
    end
  end

  describe "#runs_for_run_id" do
    it "returns all runs for the specified run ID" do
      VCR.use_cassette("runs/runs_for_run_id") do
        response = client.runs_for_run_id(5504)

        expect(response.first["route_id"]).to eq(2)
      end
    end
  end

  describe "#run_for_run_id_and_route_type" do
    it "returns run details for the specified run ID and route type" do
      VCR.use_cassette("runs/run_for_run_id_and_route_type") do
        response = client.run_for_run_id_and_route_type(5504, 0)

        expect(response["final_stop_id"]).to eq(1018)
      end
    end

    it "errors if no argument is passed" do
      expect { client.run_for_run_id_and_route_type }.to raise_error ArgumentError
    end
  end
end
