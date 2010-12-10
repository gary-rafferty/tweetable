require 'rubygems'
require 'twitter'
require 'tweetable/ext'
require 'active_record'

class ActiveRecord::Base
  extend Tweetable::Ext::ClassMethods
end
