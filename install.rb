config_file = File.open("#{Rails.root}/config/twitter.yml",'w') do |file|
  file.puts("consumer_key: \"YOUR_CONSUMER_KEY\"")
  file.puts("consumer_secret: \"YOUR_CONSUMER_SECRET\"")
  file.puts("oauth_token: \"YOUR_OAUTH_TOKEN\"")
  file.puts("oauth_token_secret: \"YOUR_OAUTH_TOKEN_SECRET\"")
  file.puts("site_url: \"http://www.yoursiteurl.ie\"")
end

puts "\nPlugin Installed"
puts "A config file has been created in config/twitter.yml"
puts "Modify this and add in your oauth details (if you don't have any, go register your app on dev.twitter.com/apps)"
puts ""
