module RubyPtv
  module Runs
    # Get all runs for the specified route ID
    #
    # Required params:
    #   route_id [Integer]
    #
    # No optional params available
    def runs_for_route_id(route_id)
      data = request("runs/route/#{route_id}")
      data["runs"]
    end

    # Get all runs for the specified route ID and route type
    #
    # Required params:
    #   route_id [Integer]
    #   route_type [Integer]
    #
    # No optional params available
    def runs_for_route_id_and_type(route_id, route_type)
      data = request("runs/route/#{route_id}/route_type/#{route_type}")
      data["runs"]
    end

    # Get all runs for the specified run ID
    #
    # Required params:
    #   run_id [Integer]
    #
    # No optional params available
    def runs_for_run_id(run_id)
      data = request("runs/#{run_id}")
      data["runs"]
    end

    # Get the run details for the specified run ID and route type
    #
    # Required params:
    #   run_id [Integer]
    #   route_type [Integer]
    #
    # No optional params available
    def run_for_run_id_and_route_type(run_id, route_type)
      data = request("runs/#{run_id}/route_type/#{route_type}")
      data["run"]
    end
  end
end
