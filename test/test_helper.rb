if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'docomo_api'

require 'minitest/autorun'
