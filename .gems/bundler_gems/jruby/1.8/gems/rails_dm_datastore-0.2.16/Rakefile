require 'rubygems'
require 'rake'

DM_VERSION = "1.0.2"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rails_dm_datastore"
    gem.summary = %Q{Integrate datamapper to Rails for the Google App Engine}
    gem.description = %Q{This gem patches all of the problems that appear from running Rails with DataMapper on the GAE.  The main patches are patching DataMapper so that it does not use the ObjectSpace (The ObjectSpace itself is also patched so that this works seamlessly).  Also ActiveView is patched so that all of the partial shortcuts work with DataMapper.  In addition, a generate is provided (dd_model) that will produce a DataMapper model.  One last note is that this gem depends on a dm-core (and other dm gems), dm-appengein, and rails_appengene so all you need is to require this gem in your gem file and you should get all the other gems you need to make DataMapper work with Rails and the GAE.}
    gem.email = ["joshsmoore@gmail.com", "woodie@netpress.com"]
    gem.homepage = "http://github.com/joshsmoore/rails_dm_datastore"
    gem.authors = ["Josh S Moore", "John Woodell"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.add_dependency 'dm-core', DM_VERSION
    gem.add_dependency 'dm-ar-finders', DM_VERSION
    gem.add_dependency 'dm-timestamps', DM_VERSION
    gem.add_dependency 'dm-validations', DM_VERSION
    gem.add_dependency 'dm-appengine'
    gem.add_dependency 'rails_appengine'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rails_dm_datastore #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
