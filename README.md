# DocomoApi

[![Build Status](https://travis-ci.org/beco-ippei/docomo-api-ruby.svg?branch=master)](https://travis-ci.org/beco-ippei/docomo-api-ruby)
[![Coverage Status](https://coveralls.io/repos/github/beco-ippei/docomo-api-ruby/badge.svg?branch=master)](https://coveralls.io/github/beco-ippei/docomo-api-ruby?branch=master)
[![Code Climate](https://codeclimate.com/github/beco-ippei/docomo-api-ruby/badges/gpa.svg)](https://codeclimate.com/github/beco-ippei/docomo-api-ruby)

Simple api wrapper for Docomo-API.
(Dialogue service only)

シンプルなドコモAPIのラッパー
(雑談APIのみ対応。他のAPIは対応未定)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'docomo-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docomo-api

## Usage

### in irb
```
$ bundle exec irb
irb(main):001:0> require 'docomo-api'
=> true
irb(main):001:0> d = DocomoAPI::Dialogue.new "XXXXXXXXXXXXXXXX"
=> #<DocomoAPI::Dialogue:0xAAAAAAAAAAAA @uri=#<URI::HTTPS https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=XXXXXXXXXXXXXXXXXXXXXXx>, @http=#<Net::HTTP api.apigw.smt.docomo.ne.jp:443 open=false>>
irb(main):002:0> d.talk '大寒波来てる'
=> "大寒波はくるんですね？テレビは見やすいですね"
```

### use Dialogue console
test for api
```
$ DOCOMO_API_KEY=XXXXXXXXXXXXXXXXXXX bundle exec bin/dialogue
start dialogue    (if you need help type 'help' and enter)
bot: 2016年になりましたね。
you: 申年やね
bot: つら
you: ぽよ
bot: ぽよ
you: exit
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/docomo-api-ruby.

