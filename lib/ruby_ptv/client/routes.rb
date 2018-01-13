module RubyPtv
  module Routes
    # Get route details of all route type
    #
    # No required params
    #
    # Optional params must have key matching official PTV param name
    def routes(options = {})
      data = request("routes", options)
      data["routes"]
    end

    # Get route details for a specified route ID
    #
    # Required params:
    #   route_id [Integer]
    #
    # No optional params available
    def route(route_id)
      data = request("routes/#{route_id}")
      data["route"]
    end
  end
end
