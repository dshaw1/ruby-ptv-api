module RubyPtv
  module Search
    # Stops, routes and myki ticket outlets that contain the specified search term
    #
    # Required params:
    #   search_term [String]
    #   NOTE: if search text is numeric and/or less than 3 characters
    #         the API will only return routes
    #
    # Optional params must have key matching official PTV param name
    def search(search_term, options = {})
      encoded_string = ERB::Util.url_encode(search_term)
      request("search/#{encoded_string}", options)
    end
  end
end
