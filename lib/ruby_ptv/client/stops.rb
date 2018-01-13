module RubyPtv
  module Stops
    # Stop location, amenity and accessibility facility information for the specified stop
    #
    # Required params:
    #   stop_id [Integer]
    #   route_type [Integer]
    #
    # Optional params must have key matching official PTV param name
    def stop(stop_id, route_type, options = {})
      data = request("stops/#{stop_id}/route_type/#{route_type}", options)
      data["stop"]
    end

    # All stops for the specified route
    #
    # Required params:
    #   route_id [Integer]
    #   route_type [Integer]
    #
    # No optional params available
    def stops_for_route(route_id, route_type)
      data = request("stops/route/#{route_id}/route_type/#{route_type}")
      data["stops"]
    end

    # All stops for the specified location
    #
    # Required params:
    #   latitude [Float]
    #   longitude [Float]
    #
    # Optional params must have key matching official PTV param name
    def stops_for_location(latitude, longitude, options = {})
      data = request("stops/location/#{latitude},#{longitude}", options)
      data["stops"]
    end
  end
end
