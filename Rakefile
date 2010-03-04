begin 
  require 'jeweler' 
  Jeweler::Tasks.new do |s| 
    s.name = "micronaut-rails" 
    s.summary = "An excellent replacement for the wheel on rails..."
    s.email = "chad@spicycode.com" 
    s.homepage = "http://github.com/spicycode/micronaut-rails" 
    s.description = "An excellent replacement for the wheel on rails..."
    s.authors = ["Chad Humphries"] 
    s.files =  FileList["[A-Z]*", "{bin,lib,examples}/**/*"] 
    s.add_dependency "actionpack", '>= 2.3.0'
    s.add_dependency "rspec-rails", '>= 2.0.0.a1'
  end 
  Jeweler::GemcutterTasks.new
rescue LoadError 
  puts "Jeweler, or one of its dependencies, is not available. Install it with: gem install jeweler" 
end

require 'rspec/core'

desc "Run all micronaut examples"
Rspec::Core::RakeTask.new :examples do |t|
  t.pattern = "examples/**/*_example.rb"
end

namespace :examples do
  desc "Run all micronaut examples using rcov"
  Rspec::Core::RakeTask.new :coverage do |t|
    t.pattern = "examples/**/*_example.rb"
    t.rcov = true
    t.rcov_opts = %[--exclude "examples/*,gems/*,db/*,/Library/Ruby/*,config/*" --text-summary  --sort coverage]
  end
end

task :default => [:check_dependencies, :examples]

begin
  %w{sdoc sdoc-helpers rdiscount}.each { |name| gem name }
  require 'sdoc_helpers'
rescue LoadError => ex
  puts "sdoc support not enabled:"
  puts ex.inspect
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "micronaut rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

