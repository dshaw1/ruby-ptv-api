require "httparty"
require "json"

module RubyPtv
  # Module used for dispatching http requests
  module Request
    include HTTParty

    # Perform HTTP get request
    #
    # path = request path
    # params = parameters hash
    #
    def request(path, params = {})
      raise StandardError, "Dev ID and secret key are required." unless @dev_id && @secret_key

      request_path = if params.empty?
                       "/v3/#{path}?devid=#{@dev_id}"
                     else
                       "/v3/#{path}?#{URI.encode_www_form(params)}&devid=#{@dev_id}"
                     end
      # Create unique SHA1 signature with each request
      signature = OpenSSL::HMAC.hexdigest("SHA1", @secret_key, request_path)
      req = "https://timetableapi.ptv.vic.gov.au" + request_path + "&signature=" + signature.upcase

      parse(HTTParty.get(req))
    end

    def parse(resp)
      JSON.parse(resp.body)
    end
  end
end
