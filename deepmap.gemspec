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
  g.summary     = "Nested hash/array function mapping."
  g.description = "Map functions over nested hash/arrays objects (e.g., YAML, JSON)."
  g.homepage    = "http://github.com/jeremywrnr/deepmap"
  g.license     = "MIT"

  g.require_path = "lib/deepmap"
  g.files        = ["lib/deepmap/deepmap.rb", "readme.md"]

  g.add_development_dependency 'rspec', '~> 3.8', '>= 3.8.0'
  g.add_development_dependency 'rake', '~> 12.3', '>= 12.3.3'
  g.add_development_dependency 'rufo', '~> 0.15', '>= 0.15.1'
end

