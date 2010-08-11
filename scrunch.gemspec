#!/usr/bin/env gem build
# encoding: utf-8

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'scrunch/version'

Gem::Specification.new do |s|
  s.name        = "scrunch"
  s.version     = Scrunch::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = "BSD"
  s.author      = "Benedict Eastaugh"
  s.email       = "benedict@eastaugh.net"
  s.homepage    = "http://github.com/ionfish/scrunch"
  s.summary     = "Minify CSS files"
  s.description = "A pure Ruby library for CSS minification."
  
  s.required_rubygems_version = ">= 1.3"
  
  s.files     = Dir.glob("lib/**/*.rb") + %w(LICENSE README.md)
  s.test_file = "test/runner.rb"
end
