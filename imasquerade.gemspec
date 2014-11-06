# -*- encoding: utf-8 -*-
require File.expand_path('../lib/imasquerade/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Lovelett"]
  gem.email         = ["ryan@lovelett.me"]
  gem.description   = %q{iMasquerade is a Ruby project that allows for the retrieval of the original XML feed used by iTunes to create a specific podcast feed. As the name suggests, the class works by masquerading as iTunes, thereby retrieving the same XML used internal to iTunes. Once this iTunes XML is retrieved it is parsed for the source feed url and is subsequently returned.}
  gem.summary       = %q{iMasquerade is a Ruby class that takes an iTunes Podcast URL and outputs the XML feed URL.}
  gem.homepage      = "https://github.com/RLovelett/imasquerade"
  gem.licenses      = ["MIT"]

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "imasquerade"
  gem.require_paths = ["lib"]
  gem.version       = Imasquerade::VERSION

  gem.add_dependency 'httparty', '~> 0.13.0'
  gem.add_dependency 'multi_json', '~> 1.10.0'
  gem.add_development_dependency 'rake', '~> 10.3.0'
  gem.add_development_dependency 'rspec', '~> 3.1.0'
  gem.add_development_dependency 'vcr', '~> 2.9.0'
  gem.add_development_dependency 'webmock', '~> 1.20.0'
end
