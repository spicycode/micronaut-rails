module Micronaut
  module Rails
    module Controllers

      module InstanceMethods
        attr_reader :request, :response, :controller
      end

      def self.extended(kls)
        kls.send(:include, ActionController::TestProcess)
        kls.send(:include, InstanceMethods)
        kls.send(:include, MicronautRails::Matchers::Controllers)

        kls.before do
          @controller = self.class.described_type.new
          @request = ActionController::TestRequest.new
          @controller.request = @request
          @response = ActionController::TestResponse.new
          @controller.params = {}
          @controller.send(:initialize_current_url)
          @response.session = @request.session
        end
      end

    end
  end
end