require 'test_helper'

class DocomoAPITest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DocomoAPI::VERSION
  end

  def test_it_has_root_url
    assert_equal(
      ::DocomoAPI::ROOT_URL,
      "https://api.apigw.smt.docomo.ne.jp"
    )
  end
end

