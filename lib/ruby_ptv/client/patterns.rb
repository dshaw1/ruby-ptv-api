module RubyPtv
  module Patterns
    # The stopping pattern of the specified run and route type
    #
    # Required params:
    #   run_id [Integer]
    #   route_type [Integer]
    #
    # Optional params must have key matching official PTV param name
    def pattern(run_id, route_type, options = {})
      data = request("pattern/run/#{run_id}/route_type/#{route_type}", options)
      data.delete("status")
      data
    end
  end
end
