require_relative "lib/deepmap/version"
require "rspec/core/rake_task"
require "rake"

task :default => :spec

# gem namen version
g = "deepmap"
v = DeepMap::Version

task :build do
  system "gem build #{g}.gemspec"
  system "gem install ./#{g}-#{v}.gem"
end

task :clean do
  puts "cleaning gems..."
  system "rm -fv *.gem"
end

task :push => [:clean, :build] do
  system "gem push #{g}-#{v}.gem"
end

task :dev do
  system "filewatcher '**/*.rb' 'clear && rake'"
end

RSpec::Core::RakeTask.new(:spec) do |rake|
  rake.verbose = true
  rake.rspec_opts = "--color "
  rake.rspec_opts << "--format documentation"
  #rake.rspec_opts << "--format progress"
end

