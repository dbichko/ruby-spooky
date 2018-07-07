require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec

# require 'rake/extensiontask'

task :build => :compile
task :compile

# Rake::ExtensionTask.new("spooky") do |ext|
  # ext.lib_dir = "lib/spooky"
# end

task :default => [:clobber, :compile, :spec]
