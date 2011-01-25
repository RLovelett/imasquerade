# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{imasquerade}
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Lovelett"]
  s.date = %q{2011-01-25}
  s.description = %q{iMasquerade is a Ruby project that allows for the retrieval of the original XML feed used by iTunes to create a specific podcast feed. As the name suggests, the class works by masquerading as iTunes, thereby retrieving the same XML used internal to iTunes. Once this iTunes XML is retrieved it is parsed for the source feed url and is subsequently returned.}
  s.email = %q{ryan@wahvee.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "imasquerade.gemspec",
    "lib/imasquerade.rb",
    "lib/imasquerade/extractor.rb",
    "lib/version.rb",
    "test/helper.rb",
    "test/test_imasquerade.rb"
  ]
  s.homepage = %q{http://github.com/RLovelett/imasquerade}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{iMasquerade is a Ruby class that takes an iTunes Podcast URL and outputs the XML feed URL.}
  s.test_files = [
    "test/helper.rb",
    "test/test_imasquerade.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<curb>, ["= 0.7.10"])
      s.add_runtime_dependency(%q<nokogiri>, ["= 1.4.4"])
      s.add_development_dependency(%q<curb>, ["= 0.7.10"])
      s.add_development_dependency(%q<nokogiri>, ["= 1.4.4"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<curb>, ["= 0.7.10"])
      s.add_dependency(%q<nokogiri>, ["= 1.4.4"])
      s.add_dependency(%q<curb>, ["= 0.7.10"])
      s.add_dependency(%q<nokogiri>, ["= 1.4.4"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<curb>, ["= 0.7.10"])
    s.add_dependency(%q<nokogiri>, ["= 1.4.4"])
    s.add_dependency(%q<curb>, ["= 0.7.10"])
    s.add_dependency(%q<nokogiri>, ["= 1.4.4"])
  end
end

