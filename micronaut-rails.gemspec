# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{micronaut-rails}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chad Humphries"]
  s.date = %q{2010-04-20}
  s.description = %q{An excellent replacement for the wheel on rails...}
  s.email = %q{chad@spicycode.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README"
  ]
  s.files = [
    "LICENSE",
     "README",
     "RSPEC-LICENSE",
     "Rakefile",
     "VERSION.yml",
     "examples/example_helper.rb",
     "examples/lib/micronaut-rails_example.rb",
     "examples/lib/micronaut/rails/configuration_example.rb",
     "lib/micronaut-rails.rb",
     "lib/micronaut/rails/configuration.rb",
     "lib/micronaut/rails/controllers.rb",
     "lib/micronaut/rails/extensions/active_record.rb",
     "lib/micronaut/rails/helpers.rb",
     "lib/micronaut/rails/matchers/controllers/redirect_to.rb",
     "lib/micronaut/rails/matchers/controllers/render_template.rb",
     "lib/micronaut/rails/mocking/model_stubber.rb",
     "lib/micronaut/rails/mocking/with_mocha.rb",
     "lib/micronaut/rails/mocking/with_rr.rb",
     "lib/micronaut/rails/transactional_database_support.rb"
  ]
  s.homepage = %q{http://github.com/spicycode/micronaut-rails}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{An excellent replacement for the wheel on rails...}
  s.test_files = [
    "examples/example_helper.rb",
     "examples/lib/micronaut/rails/configuration_example.rb",
     "examples/lib/micronaut-rails_example.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 2.3.0"])
      s.add_runtime_dependency(%q<micronaut>, [">= 0.3.0"])
    else
      s.add_dependency(%q<actionpack>, [">= 2.3.0"])
      s.add_dependency(%q<micronaut>, [">= 0.3.0"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 2.3.0"])
    s.add_dependency(%q<micronaut>, [">= 0.3.0"])
  end
end

