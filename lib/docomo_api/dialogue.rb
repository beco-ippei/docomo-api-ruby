require 'uri'
require 'json'
require 'openssl'
require 'net/http'

module DocomoAPI
  class Dialogue
    API_URL = "#{DocomoAPI::ROOT_URL}/dialogue/v1/dialogue"
    def initialize(key)
      @uri = URI.parse("#{API_URL}?APIKEY=#{key}")
      @http = Net::HTTP.new(@uri.host, @uri.port)
      @http.use_ssl = true
    end

    #TODO: set 't' option

    def reset
      @context = nil
    end

    # call api
    def talk(msg)
      response = @http.start do |h|
        res = h.request(request(msg))
        JSON.parse(res.body)
      end

      if err = response['requestError']
        raise err.inspect
      end

      @context = response['context']
      response['utt']
    end

    private

    def request(msg)
      body = {
        'utt' => msg,
      }
      body['context'] = @context if @context
      request = Net::HTTP::Post.new(
        @uri.request_uri,
        'Content-Type' => 'application/json'
      )
      request.body = body.to_json
      request
    end
  end
end
