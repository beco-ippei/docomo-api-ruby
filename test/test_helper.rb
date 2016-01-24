if ENV['CI']
  require 'coveralls'
  Coveralls.wear!

  SimpleCov.formatters = [
    Coveralls::SimpleCov::Formatter,
    CodeClimate::TestReporter::Formatter,
  ]

  SimpleCov.start
  #CodeClimate::TestReporter.start
end


$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'docomo_api'
require 'webmock/minitest'

require 'minitest/autorun'
