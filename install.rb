config_file = File.open("#{Rails.root}/config/twitter.yml",'w') do |file|
  file.write("consumer_key: \"YOUR_CONSUMER_KEY\"")
  file.write("consumer_secret: \"YOUR_CONSUMER_SECRET\"")
  file.write("oauth_token: \"YOUR_OAUTH_TOKEN\"")
  file.write("oauth_token_secret: \"YOUR_OAUTH_TOKEN_SECRET\"")
end

puts "\nPlugin Installed"
puts "A config file has been created in config/twitter.yml"
puts "Modify this and add in your oauth details (if you don't have any, go register your app on dev.twitter.com/apps)"
puts ""
