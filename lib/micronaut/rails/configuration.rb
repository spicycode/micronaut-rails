module Micronaut
  module Rails
    
    module Configuration
      
      def rails
        self
      end
      
      # :behaviour => { :describes => lambda { |dt| dt < ActiveRecord::Base }
      def enable_active_record_transactional_support(filter_options={})
        if filter_options.empty?
          ::Micronaut::Behaviour.send(:extend, ::Micronaut::Rails::TransactionalDatabaseSupport)
        else
          ::Micronaut.config.extend(::Micronaut::Rails::TransactionalDatabaseSupport, filter_options)
        end
      end
      
      # :behaviour => { :describes => lambda { |dt| dt.to_s.ends_with?('Helper') }
      def enable_helper_support(filter_options={})
        if filter_options.empty?
          ::Micronaut::Behaviour.send(:extend, ::Micronaut::Rails::Helpers)
        else
          ::Micronaut.config.extend(::Micronaut::Rails::Helpers, filter_options)
        end 
      end
      
      # :behaviour => { :describes => lambda { |dt| dt < ActionController::Base } 
      def enable_controller_support(filter_options={})
        if filter_options.empty?
          ::Micronaut::Behaviour.send(:extend, ::Micronaut::Rails::Controllers)
        else
          ::Micronaut.config.extend(::Micronaut::Rails::Controllers, filter_options)
        end
      end
      
      def enable_rails_specific_mocking_extensions
        case ::Micronaut.config.mock_framework.to_s
        when /mocha/i
          require 'micronaut/rails/mocking/with_mocha'
          Micronaut::Behaviour.send(:include, Micronaut::Rails::Mocking::WithMocha)
        end
      end
      
      def enable_reasonable_defaults!
        enable_active_record_transactional_support :describes => lambda { |dt| dt < ::ActiveRecord::Base }
        enable_helper_support :describes => lambda { |dt| dt.to_s.ends_with?('Helper') }
        enable_controller_support :describes => lambda { |dt| dt < ::ActionController::Base }
        enable_rails_specific_mocking_extensions
      end
      
    end
    
  end
end

::Micronaut::Configuration.send(:include, ::Micronaut::Rails::Configuration)