#!/usr/bin/env ruby
# 0-simply_match_school.rb

def match_school(arg)
  regex = /School/
  match = arg.scan(regex).join
  puts match + '$'
end

if ARGV.empty?
  puts "Usage: ruby 0-simply_match_school.rb <string>"
else
  match_school(ARGV[0])
end
