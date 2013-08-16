require 'rubygems'
require 'bundler/setup'

FILE_ROOT = File.expand_path('.') 

Dir[File.join(FILE_ROOT,"lib/just_inform/*.rb")].each {|file| require file }

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