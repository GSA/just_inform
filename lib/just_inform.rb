module JustInform
  def self.new
    Parser.new
  end
end

require 'just_inform/downloader'
require 'just_inform/information_collection'
require 'just_inform/information_collection_request'
require 'just_inform/parser'
require 'just_inform/version'
