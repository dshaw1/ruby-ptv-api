module RubyPtv
  module Departures
    # Get departures for all routes for a specified stop
    #
    # Required params:
    #   route_type [Integer]
    #   stop_id [Integer]
    #
    # Optional params must have key matching official PTV param name
    def departures(route_type, stop_id, options = {})
      request("departures/route_type/#{route_type}/stop/#{stop_id}", options)
    end

    # Get departures for a single route for a specified stop
    #
    # Required params:
    #   route_type [Integer]
    #   stop_id [Integer]
    #   route_id [String]
    #
    # Optional params must have key matching official PTV param name
    def departures_for_route(route_type, stop_id, route_id, options = {})
      request("departures/route_type/#{route_type}/stop/#{stop_id}/route/#{route_id}", options)
    end
  end
end
