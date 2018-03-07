lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vfrmap/version"

Gem::Specification.new do |spec|
  spec.name          = "vfrmap"
  spec.version       = Vfrmap::VERSION
  spec.authors       = ["Ryan Burnette"]
  spec.email         = ["ryan.burnette@gmail.com"]
  spec.summary       = "An implementation of the VFRMAP API in Ruby."
  spec.homepage      = "https://github.com/ryanburnette/vfrmap"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.2.5"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.3"
  spec.add_development_dependency "pry", "~> 0.11"

  spec.add_dependency "padrino-helpers", "~> 0.13"
  spec.add_dependency "geo_coord", "~> 0.1"
  spec.add_dependency "airports", "~> 1.0"
  spec.add_dependency "addressable", "~> 2.5"
end
