require File.expand_path(File.dirname(__FILE__) + "/../../../example_helper")

describe Micronaut::Rails::Configuration do

  example "loading micronaut rails include it in the micronaut configuration class" do
    Micronaut::Configuration.included_modules.should include(Micronaut::Rails::Configuration)
  end
  
  it "should add a #rails method" do
    Micronaut.configuration.should respond_to(:rails)
  end
  
  it "should add an #enable_active_record_transactional_support method" do
    Micronaut.configuration.should respond_to(:enable_active_record_transactional_support)
  end

end