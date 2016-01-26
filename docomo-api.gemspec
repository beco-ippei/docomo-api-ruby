# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docomo_api/version'

Gem::Specification.new do |spec|
  spec.name          = "docomo-api"
  spec.version       = DocomoAPI::VERSION
  spec.authors       = ["beco-ippei"]
  spec.email         = ["beco.ippei@gmail.com"]

  spec.summary       = %q{Simple API wrapper for Docomo talk API(s).}
  spec.description   = %q{}
  spec.homepage      = "http://github.com/beco-ippei/docomo-api-ruby"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
