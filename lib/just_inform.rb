module JustInform; end

module Nokogiri
  module XML
    class Node
      
      def inspect_attributes
        [:name]
      end
      
    end
  end
end

module Nokogiri
  module XML

    class Document < Nokogiri::XML::Node

      def inspect_attributes
          [:name, :children]
      end

    end
  end
end

require 'just_inform/downloader'
require 'just_inform/information_collection'
require 'just_inform/information_collection_request'
require 'just_inform/parser'
require 'just_inform/version'
