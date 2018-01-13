lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_ptv/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_ptv"
  spec.version       = RubyPtv::VERSION
  spec.authors       = ["Dylan Shaw"]
  spec.email         = ["dylanshaw012@gmail.com"]

  spec.summary       = "A wrapper for the Public Transport Victoria API written in Ruby. The official documentation is                            available here: https://timetableapi.ptv.vic.gov.au/swagger/ui/index."
  spec.description   = "Add a description later.."
  spec.homepage      = "https://github.com/dshaw1/ruby-ptv-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.13.7"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "dotenv", "~> 2.2"
  spec.add_development_dependency "multi_json", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.1"
end
