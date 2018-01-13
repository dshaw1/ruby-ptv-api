module RubyPtv
  module Directions
    # Get all routes that travel in a specified direction
    #
    # Required params:
    #   direction_id [Integer]
    #
    # No optional params available
    def direction(direction_id)
      data = request("directions/#{direction_id}")
      data["directions"]
    end

    # Get all directions that a specified route travels in
    #
    # Required params:
    #   route_id [Integer]
    #
    # No optional params available
    def directions_for_route(route_id)
      data = request("directions/route/#{route_id}")
      data["directions"]
    end

    # Get all routes of the specified route type that travel in the specified direction
    #
    # Required params:
    #   direction_id [Integer]
    #   route_id [Integer]
    #
    # No optional params available
    def directions_for_route_type(direction_id, route_type)
      data = request("directions/#{direction_id}/route_type/#{route_type}")
      data["directions"]
    end
  end
end
