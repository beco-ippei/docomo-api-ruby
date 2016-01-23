require 'test_helper'

class DocomoAPI::DialogueTest < Minitest::Test
  def setup
    @host = "api.apigw.smt.docomo.ne.jp"
    @api = "https://#{@host}/dialogue/v1/dialogue"
    @token = 'ABC0123XYZ'
    @dialogue = ::DocomoAPI::Dialogue.new @token
  end

  def test_it_has_api_url
    assert_equal @api, ::DocomoAPI::Dialogue::API_URL
  end

  def test_its_instance_has_attrs_for_request
    uri = URI.parse "#{@api}?APIKEY=#{@token}"
    actual = @dialogue.instance_variable_get :@uri
    assert_equal uri, actual

    exp = {
      host: @host,
      port: 443,
      #use_ssl: true,     #TODO: ??
    }
    http = @dialogue.instance_variable_get :@http
    assert_equal exp, {
      host: http.address,
      port: http.port,
    }
  end

  def test_reset
    ctx = 'text-ctx'
    @dialogue.instance_variable_set :@context, ctx
    @dialogue.reset

    actual = @dialogue.instance_variable_get :@context
    assert_equal nil, actual
  end

  def test_talk
    #TODO
  end

  def test_it_makes_request_body
    msg = "test-message"

    req = @dialogue.send :request, msg
    exp_body = {utt: msg}.to_json
    assert_equal exp_body, req.body

    # set context
    ctx = 'text-ctx'
    @dialogue.instance_variable_set :@context, ctx

    req = @dialogue.send :request, msg
    exp_body = {utt: msg, context: ctx}.to_json
    assert_equal exp_body, req.body
  end
end
