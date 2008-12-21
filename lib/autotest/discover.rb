Autotest.add_discovery do
  "micronaut-rails" if File.directory?('examples')
end
