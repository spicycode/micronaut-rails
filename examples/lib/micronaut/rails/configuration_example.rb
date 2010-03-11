require File.expand_path(File.dirname(__FILE__) + "/../../../example_helper")

describe Micronaut::Rails::Configuration do

  example "loading micronaut rails include it in the micronaut configuration class" do
    Rspec::Core::Configuration.included_modules.should include(Micronaut::Rails::Configuration)
  end
  
  it "should add a #rails method" do
    Rspec::Core::Configuration.new.should respond_to(:rails)
  end
  
  it "should add an #enable_active_record_transactional_support method" do
    Rspec::Core::Configuration.new.should respond_to(:enable_active_record_transactional_support)
  end
  
  describe "helpers for standard Rails testing support" do
    
    method_to_modules = { :enable_helper_support => Micronaut::Rails::Helpers,
                          :enable_active_record_transactional_support => Micronaut::Rails::TransactionalDatabaseSupport,
                          :enable_controller_support => Micronaut::Rails::Controllers
                        }
    method_to_modules.each do |method, mod| 
      example "##{method} with no filter options" do
        Rspec::Core.configuration.send(method)
        Rspec::Core.configuration.include_or_extend_modules.should include([:extend, mod, {}])
      end
      
      example "##{method} with filter options" do
        filter_options = {:options => { "foo" => "bar" } }
        Rspec::Core.configuration.send(method, filter_options)
        Rspec::Core.configuration.include_or_extend_modules.should include([:extend, mod, filter_options])
      end
    end
    
    example "#enable_rails_specific_mocking_extensions for mocha with no filter options" do
      Rspec::Core.configuration.mock_with :mocha
      Rspec::Core.configuration.enable_rails_specific_mocking_extensions
      Rspec::Core.configuration.include_or_extend_modules.should include([:include, Micronaut::Rails::Mocking::WithMocha, {}])
    end

  end

end