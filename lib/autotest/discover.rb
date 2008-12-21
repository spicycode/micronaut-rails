Autotest.add_discovery do
  "micronaut_rails" if File.directory?('examples')
end
