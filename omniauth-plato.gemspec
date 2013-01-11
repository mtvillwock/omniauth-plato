# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-plato/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["John Kelly"]
  gem.email         = ["jkelly@teachtci.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-plato"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Plato::VERSION
end
