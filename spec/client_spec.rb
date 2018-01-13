require "spec_helper"

RSpec.describe RubyPtv::Client do
  let(:client) { RubyPtv::Client.new(dev_id: ENV["DEV_ID"], secret_key: ENV["SECRET_KEY"]) }

  describe "#new" do
    it "raises an ArgumentError if the argument provided is not a hash" do
      expect { RubyPtv::Client.new("foo") }.to raise_error(ArgumentError)
    end
  end
end
