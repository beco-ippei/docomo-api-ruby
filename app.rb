APIKEY = ENV['DOCOMO_API_KEY']
unless APIKEY
  puts "environment variable 'DOCOMO_API_KEY' is mising'"
  exit 1
end

require './lib/dialogue'

dialog = DocomoAPI::Dialogue.new APIKEY
msg = ''
puts "start dialogue    (if you need help type 'help' and enter)"
loop do
  if /^reset$/i =~ msg
    dialog.reset
  elsif /^help$/i =~ msg
    puts <<-HELP
      reset   ... reset dialogue context
      exit   ... exit dialogue session
      help   ... this messages
    HELP
  else
    res = dialog.talk msg
    puts "bot: #{res}"
  end

  print 'you: '
  msg = gets.chomp

  break if /^exit$/i =~ msg
end
