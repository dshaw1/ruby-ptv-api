require "bundler/setup"
require_relative "../lib/ruby_ptv"
require "webmock/rspec"

RSpec.configure do |config|
  config.before(:each) do
    WebMock.reset!
    WebMock.disable_net_connect!
  end

  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require "vcr"
VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.default_cassette_options = { record: :once }
  config.ignore_localhost = true
  config.filter_sensitive_data("[DEV_ID]") { ENV.fetch("DEV_ID") }
  config.default_cassette_options = {
    serialize_with: :json,
    match_requests_on: %i[method body],
    preserve_exact_body_bytes: true
  }
end

# Load dev_id and secret_key from env variables
require "dotenv"
Dotenv.load

def base_url(params)
  "https://timetableapi.ptv.vic.gov.au#{params}"
end
