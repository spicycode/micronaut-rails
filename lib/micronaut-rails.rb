require 'action_controller'
require 'action_controller/test_process'
require 'micronaut/rails/matchers/controllers/redirect_to'
require 'micronaut/rails/matchers/controllers/render_template'
require 'micronaut/rails/transactional_database_support'
require 'micronaut/rails/helpers'
require 'micronaut/rails/controllers'

module Micronaut
  module Rails
    class IllegalDataAccessException < StandardError; end

    def self.include_in(config)
      if config.mock_framework.to_s =~ /mocha/i
        require 'micronaut/rails/mocking/with_mocha'
        Micronaut::Behaviour.send(:include, Micronaut::Rails::Mocking::WithMocha)
      end
      config.extend(Micronaut::Rails::TransactionalDatabaseSupport, :described_type => lambda { |dt| dt < ActiveRecord::Base })
      config.extend(Micronaut::Rails::Helpers, :described_type => lambda { |dt| dt.to_s.ends_with?('Helper') })
      config.extend(Micronaut::Rails::Controllers, :described_type => lambda { |dt| dt < ActionController::Base })
    end
  end

end