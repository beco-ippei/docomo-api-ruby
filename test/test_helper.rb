$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'docomo_api'

require 'minitest/autorun'

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[Coveralls::SimpleCov::Formatter]
  SimpleCov.start 'test_frameworks'
end
