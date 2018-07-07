require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/extensiontask'

RSpec::Core::RakeTask.new :spec

Rake::ExtensionTask.new('spooky') do |ext|
  ext.lib_dir = 'lib/spooky'
end

task :build => :compile
task :clear => :clobber
task :default => [:compile, :spec]
