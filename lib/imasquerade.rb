$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'uri'
require 'cgi'
require 'curb'
require 'nokogiri'

require 'imasquerade/extractor'
require 'imasquerade/version'