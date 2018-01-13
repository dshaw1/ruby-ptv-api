module RubyPtv
  module RouteTypes
    # Get all route types (modes of transport) and their names
    #
    # No required params
    #
    # No optional params available
    def route_types
      data = request("route_types")
      data["route_types"]
    end
  end
end
