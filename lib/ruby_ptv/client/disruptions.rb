module RubyPtv
  module Disruptions
    # Get all disruption information
    #
    # No required params
    #
    # Optional params must have key matching official PTV param name
    def disruptions(options = {})
      data = request("disruptions", options)
      data["disruptions"]
    end

    # Get all disruption information for a specified route
    #
    # Required params:
    #   route_id [Integer]
    #
    # Optional params must have key matching official PTV param name
    def disruptions_for_route(route_id, options = {})
      data = request("disruptions/route/#{route_id}", options)
      data["disruptions"]
    end

    # Get information on a specified disruption
    #
    # Required params:
    #   dispruption_id [Integer]
    #
    # No optional params available
    def disruption(disruption_id)
      data = request("disruptions/#{disruption_id}")
      data["disruption"]
    end
  end
end
