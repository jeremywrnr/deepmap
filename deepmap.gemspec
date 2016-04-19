lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "deepmap/version"

Gem::Specification.new do |g|
  g.author      = "Jeremy Warner"
  g.email       = "jeremywrnr@gmail.com"

  g.name        = "deepmap"
  g.version     = DeepMap::Version
  g.platform    = Gem::Platform::RUBY
  g.date        = Time.now.strftime("%Y-%m-%d")
  g.summary     = "nested hash/arrap function mapping"
  g.description = "easily map functions over key/vals of nested hash/arrays objects (eg JSON)"
  g.homepage    = "http://github.com/jeremywrnr/deepmap"
  g.license     = "MIT"

  g.require_path = "lib/deepmap"
  g.files        = ["lib/deepmap/deepmap.rb", "readme.md"]
  #g.add_development_dependency "rspec-mocks"
  g.add_development_dependency "rspec"
  g.add_development_dependency "rake"
end

