require "ruby_ptv/client/departures"
require "ruby_ptv/client/directions"
require "ruby_ptv/client/disruptions"
require "ruby_ptv/client/patterns"
require "ruby_ptv/client/routes"
require "ruby_ptv/client/route_types"
require "ruby_ptv/client/runs"
require "ruby_ptv/client/search"
require "ruby_ptv/client/stops"
require "ruby_ptv/request"

module RubyPtv
  class Client
    include RubyPtv::Request
    include RubyPtv::Departures
    include RubyPtv::Directions
    include RubyPtv::Disruptions
    include RubyPtv::Patterns
    include RubyPtv::Routes
    include RubyPtv::RouteTypes
    include RubyPtv::Runs
    include RubyPtv::Search
    include RubyPtv::Stops

    # Initialize a RubyPtv::Client instance
    #
    # Both must be passed in:
    #   options[:dev_id] = PTV developer ID
    #   options[:secret_key] = PTV developer key
    #
    def initialize(options = {})
      raise ArgumentError, "Options hash required." unless options.is_a?(Hash)

      @dev_id     = options[:dev_id]
      @secret_key = options[:secret_key]
    end
  end
end
