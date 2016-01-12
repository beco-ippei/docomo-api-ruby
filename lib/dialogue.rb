require 'uri'
require 'json'
require 'openssl'
require 'net/http'

module DocomoAPI
  API_URL = "https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue"

  class Dialogue
    def initialize(key)
      @uri = URI.parse("#{DocomoAPI::API_URL}?APIKEY=#{APIKEY}")
      @http = Net::HTTP.new(@uri.host, @uri.port)
      @http.use_ssl = true
    end

    #TODO: set 't' option

    def reset
      @context = nil
    end

    # call api
    #TODO: better method name...
    def talk(msg)
      response = @http.start do |h|
        res = h.request(request(msg))
        JSON.parse(res.body)
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
