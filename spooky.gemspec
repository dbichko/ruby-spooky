
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spooky/version'

Gem::Specification.new do |spec|

  spec.name          = 'spooky'
  spec.version       = SpookyHashV2::VERSION
  spec.authors       = ['Dmitri Bichko']
  spec.email         = ['dbichko@gmail.com']

  spec.summary       = 'SpookyHash for Ruby'
  spec.description   = 'Ruby wrapper for SpookyHash V2'
  spec.homepage      = 'https://github.com/dbichko/ruby-spooky'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.require_paths = ['lib']
  spec.extensions    = ['ext/spooky/extconf.rb']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'rspec'
end
