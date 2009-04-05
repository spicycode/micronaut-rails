# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{micronaut-rails}
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chad Humphries"]
  s.date = %q{2009-04-05}
  s.description = %q{An excellent replacement for the wheel on rails...}
  s.email = %q{chad@spicycode.com}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["LICENSE", "Rakefile", "README", "RSPEC-LICENSE", "VERSION.yml", "lib/micronaut", "lib/micronaut/rails", "lib/micronaut/rails/configuration.rb", "lib/micronaut/rails/controllers.rb", "lib/micronaut/rails/extensions", "lib/micronaut/rails/extensions/active_record.rb", "lib/micronaut/rails/helpers.rb", "lib/micronaut/rails/matchers", "lib/micronaut/rails/matchers/controllers", "lib/micronaut/rails/matchers/controllers/redirect_to.rb", "lib/micronaut/rails/matchers/controllers/render_template.rb", "lib/micronaut/rails/mocking", "lib/micronaut/rails/mocking/model_stubber.rb", "lib/micronaut/rails/mocking/with_mocha.rb", "lib/micronaut/rails/mocking/with_rr.rb", "lib/micronaut/rails/transactional_database_support.rb", "lib/micronaut-rails.rb", "examples/example_helper.rb", "examples/lib", "examples/lib/micronaut", "examples/lib/micronaut/rails", "examples/lib/micronaut/rails/configuration_example.rb", "examples/lib/micronaut-rails_example.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/spicycode/micronaut-rails}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{An excellent replacement for the wheel on rails...}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 2.2.2"])
      s.add_runtime_dependency(%q<spicycode-micronaut>, [">= 0.2.2"])
    else
      s.add_dependency(%q<actionpack>, [">= 2.2.2"])
      s.add_dependency(%q<spicycode-micronaut>, [">= 0.2.2"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 2.2.2"])
    s.add_dependency(%q<spicycode-micronaut>, [">= 0.2.2"])
  end
end
