# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "imasquerade"
  gem.version = Imasquerade::Version::STRING
  gem.homepage = "http://github.com/RLovelett/imasquerade"
  gem.license = "MIT"
  gem.summary = %Q{iMasquerade is a Ruby class that takes an iTunes Podcast URL and outputs the XML feed URL.}
  gem.description = %Q{iMasquerade is a Ruby project that allows for the retrieval of the original XML feed used by iTunes to create a specific podcast feed. As the name suggests, the class works by masquerading as iTunes, thereby retrieving the same XML used internal to iTunes. Once this iTunes XML is retrieved it is parsed for the source feed url and is subsequently returned.}
  gem.email = "ryan@wahvee.com"
  gem.authors = ["Ryan Lovelett"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "imasquerade #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
