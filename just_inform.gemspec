# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'just_inform/version'

Gem::Specification.new do |s|
  s.name        = 'just_inform'
  s.version     = JustInform::VERSION
  s.date        = '2013-08-15'
  s.authors     = ["Justin Grevich"]
  s.summary     = "Reginfo.gov XML Forms Report Data Parser"
  s.description = "A library to help parse the XML report published by Reginfo.gov (http://www.reginfo.gov/public/do/PRAXML)"
  s.email       = 'justin@grevi.ch'
  s.files       =  [
    "Gemfile",
    "Gemfile.lock",
    "just_inform.gemspec",
    "LICENSE.md",
    "README.md",
    'data',
    "lib/just_inform.rb",
    "lib/just_inform/downloader.rb",
    "lib/just_inform/information_collection.rb",
    "lib/just_inform/information_collection_request.rb",
    "lib/just_inform/parser.rb",
    "lib/just_inform/version.rb"]
  s.homepage    = 'https://github.com/GSA-OCSIT/just_inform'
  s.license     = 'MIT'
  s.platform    = Gem::Platform::RUBY
  s.add_dependency('nokogiri', '~> 1.6.0')
  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
  s.extra_rdoc_files = %w[README.md LICENSE.md]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  
end
