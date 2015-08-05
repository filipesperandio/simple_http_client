# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "simple_http_client"
  spec.version       = '0.0.1'
  spec.authors       = ["Filipe Esperandio"]
  spec.email         = ["filipesperandio@gmail.com"]

  spec.summary       = %q{Simple Http Client for a better experience on simple needs}
  spec.description   = %q{Simple Http Client aims to provide a simpler interface to Net:HTTP request objects}
  spec.homepage      = "http://github.com/filipesperandio/simple_http_client"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'spork', '~> 0.9'
  spec.add_development_dependency 'rack', '~> 1.6'
end
