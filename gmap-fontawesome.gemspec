# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gmap/fontawesome/version'

Gem::Specification.new do |spec|
  spec.name = "gmap-fontawesome"
  spec.version = Gmap::Fontawesome::VERSION
  spec.authors = ["Marino"]
  spec.email = ["marinobonetti@gmail.com"]
  spec.summary = %q{Font awesome svg path is for google maps}
  spec.description = %q{Font-awesome svg path is for google maps, whith rake task to download and compile the last version of the icons }
  spec.homepage = "https://github.com/oniram88/gmap-fontawesome"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib,vendor"]


  spec.add_runtime_dependency 'rubyzip', '~> 1.1', '>= 1.1.3'
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency 'rake', '~> 10.3', '>= 10.3.2'
end
