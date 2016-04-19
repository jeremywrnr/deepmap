lib = File.expand_path("../../lib/deepmap", __FILE__)
$:.unshift lib unless $:.include?(lib)


# helper for rspec
require "fileutils"
require "deepmap"
require "find"

