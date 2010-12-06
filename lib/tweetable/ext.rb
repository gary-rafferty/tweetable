module Tweetable
  module Ext
    module ClassMethods
      def tweetable
        after_save :tweet
        include Ext::InstanceMethods
      end
    end
    module InstanceMethods
      def tweet
        if File.exists?("#{Rails.root}/config/twitter.yml")
          @twitter_config = YAML.load_file("#{Rails.root}/config/twitter.yml")
        else
          raise "Could not load the twitter config file.
                Looks like the plugin didn't create it, or maybe somebody deleted it.
                Bad buzz,..... go create it yourself.
                Format should be
                consumer_key:YOUR_CONSUMER_KEY
                consumer_secret:YOUR_CONSUMER_SECRET
                oauth_token:YOUR_OAUTH_TOKEN
                oauth_token_secret:YOUR_OAUTH_TOKEN_SECRET\n
                Save it as config/twitter.yml"
        end
        
        #The following creates a sample URL of "URL/controller/show/id"
        #Obv this will only work if you are using a sample route
        #Nested routes will probably bomb out
        
        @consumer_key = @twitter_config["consumer_key"]
        @consumer_secret = @twitter_config["consumer_secret"]
        @oauth_token = @twitter_config["oauth_token"]
        @oauth_token_secret = @twitter_config["oauth_token_secret"]

        @url = @twitter_config["site_url"]

        @body="#{@url}/#{self.class.to_s.downcase.pluralize}/#{self.id}"
        
        Twitter.configure do |config|
          config.consumer_key = @consumer_key
          config.consumer_secret = @consumer_secret
          config.oauth_token = @oauth_token
          config.oauth_token_secret = @oauth_token_secret
        end
        
        Twitter.update("New law posted at #{@body}")

      end
    end
  end
end
