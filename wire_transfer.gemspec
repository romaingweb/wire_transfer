# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wire_transfer/version'

Gem::Specification.new do |spec|
  spec.name          = "wire_transfer"
  spec.version       = WireTransfer::VERSION
  spec.authors       = ["Romain G\xC3\xA9rard"]
  spec.email         = ["romaingweb@gmail.com"]
  spec.summary       = %q{Generate communication for belgian wire transfer.}
  spec.description   = %q{Add capability to generate belgian structured communication for wire transfer from any number.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
