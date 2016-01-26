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

  def test_its_instance_has_uri
    uri = URI.parse "#{@api}?APIKEY=#{@token}"
    actual = @dialogue.instance_variable_get :@uri
    assert_equal uri, actual
  end

  def test_its_instance_has_attrs_for_request
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
    req = {
      body: /"utt":"[^"]*雪が降りそう/,
      headers: {"Content-Type" => /\/json$/},
    }
    exp_msg = '足元に気をつけてくださいね'
    exp_ctx = 'text-exp-ctx'
    return_body = {
      utt: exp_msg,
      context: exp_ctx,
    }.to_json

    # stubbing
    stub_request(:post, "#{@api}?APIKEY=#{@token}").
      with(req).
      to_return(:body => return_body)

    msg = '明日は雪が降りそうですね :snowman:'

    # get response message
    ret = @dialogue.talk msg
    assert_equal exp_msg, ret

    # get response context
    res_ctx = @dialogue.instance_variable_get :@context
    assert_equal exp_ctx, res_ctx
  end

  def test_talk_with_error
    req = {
      body: /"utt":"[^"]*エラーが欲しい/,
      headers: {"Content-Type" => /\/json$/},
    }
    return_body = {
      'requestError' => {
        'someException' => {'msg' => 'failed anything'}
      }
    }.to_json

    # stubbing
    stub_request(:post, "#{@api}?APIKEY=#{@token}").
      with(req).
      to_return(:body => return_body)

    msg = '別にエラーが欲しいわけじゃないんだからね'

    # raise exception
    assert_raises StandardError do
      @dialogue.talk msg
    end
  end

  def test_it_makes_request_body
    msg = "test-message"

    req = @dialogue.send :request, msg
    exp_body = {utt: msg}.to_json
    assert_equal exp_body, req.body
  end

  def test_it_makes_request_body_with_context
    msg = "test-message"
    ctx = 'text-ctx'
    @dialogue.instance_variable_set :@context, ctx

    req = @dialogue.send :request, msg
    exp_body = {utt: msg, context: ctx}.to_json
    assert_equal exp_body, req.body
  end
end

