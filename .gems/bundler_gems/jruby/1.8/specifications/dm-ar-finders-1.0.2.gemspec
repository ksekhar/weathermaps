# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-ar-finders}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John W Higgins"]
  s.date = %q{2010-09-07}
  s.description = %q{DataMapper plugin providing ActiveRecord-style finders}
  s.email = %q{john [a] wishVPS [d] com}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".gitignore", "Gemfile", "LICENSE", "README.rdoc", "Rakefile", "VERSION", "dm-ar-finders.gemspec", "lib/dm-ar-finders.rb", "spec/integration/ar-finders_spec.rb", "spec/rcov.opts", "spec/spec.opts", "spec/spec_helper.rb", "tasks/ci.rake", "tasks/local_gemfile.rake", "tasks/metrics.rake", "tasks/spec.rake", "tasks/yard.rake", "tasks/yardstick.rake"]
  s.homepage = %q{http://github.com/datamapper/dm-ar-finders}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{datamapper}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{DataMapper plugin providing ActiveRecord-style finders}
  s.test_files = ["spec/integration/ar-finders_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["~> 1.0.2"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3"])
    else
      s.add_dependency(%q<dm-core>, ["~> 1.0.2"])
      s.add_dependency(%q<rspec>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<dm-core>, ["~> 1.0.2"])
    s.add_dependency(%q<rspec>, ["~> 1.3"])
  end
end
