require 'rubygems'
require 'twitter'
require 'tweetable/ext'

class ActiveRecord::Base
  extend Tweetable::Ext::ClassMethods
end
