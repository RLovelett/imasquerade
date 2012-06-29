# -*- encoding: utf-8 -*-
require File.expand_path('../lib/imasquerade/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Lovelett"]
  gem.email         = ["ryan@wahvee.com"]
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

  gem.add_dependency             "curb"
  gem.add_dependency             "nokogiri"
  gem.add_dependency             "plist"
  gem.add_dependency             "colorize"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "shoulda"
end
