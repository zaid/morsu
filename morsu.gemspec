# -*- encoding: utf-8 -*-
require File.expand_path('../lib/morsu/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zaid Al-Jarrah"]
  gem.email         = ["zaid.aljarrah@gmail.com"]
  gem.description   = %q{A simple Morse code library}
  gem.summary       = %q{A library to parse Morse code to plaintext and vice versa}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "morsu"
  gem.require_paths = ["lib"]
  gem.version       = Morsu::VERSION

  gem.add_dependency "thor"
  gem.add_development_dependency "rspec", "~> 2.11"
end
