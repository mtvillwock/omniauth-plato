# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-plato/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["John Kelly", "Taru Jain"]
  gem.email         = ["jkelly@teachtci.com", "tjain@teachtci.com"]
  gem.description   = %q{TCI OAuth2 Strategy for Omniauth 1.0}
  gem.summary       = %q{TCI OAuth2 Strategy for Omniauth 1.0}
  gem.homepage      = "https://github.com/johnkelly/omniauth-plato"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-plato"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Plato::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_development_dependency 'rspec', '~> 2.7'
end
