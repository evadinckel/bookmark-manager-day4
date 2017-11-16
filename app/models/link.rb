require 'dm-postgres-adapter'
require 'data_mapper'
require_relative 'tag.rb'
# require_relative 'tagging'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# DataMapper.setup(:test, 'postgres://localhost/bookmark_manager_test')
DataMapper::Logger.new($stdout, :debug)
class Link
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, Text
  property :tag, String

  # has n, :taggings
  has n, :tags, :through => Resource


end


DataMapper.finalize
DataMapper.auto_upgrade!
