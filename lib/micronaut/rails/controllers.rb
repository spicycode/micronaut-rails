require 'action_controller'
require 'action_controller/test_process'

module Micronaut
  module Rails
    module Controllers

      module InstanceMethods
        attr_reader :request, :response, :controller

        def route_for(options)
          ActionController::Routing::Routes.reload if ActionController::Routing::Routes.empty?
          ActionController::Routing::Routes.generate(options)
        end

        def params_from(method, path)
          ActionController::Routing::Routes.reload if ActionController::Routing::Routes.empty?
          ActionController::Routing::Routes.recognize_path(path, :method => method)
        end

      end

      module RenderOverrides

        def render_views!
          @render_views = true
        end

        def render_views?
          @render_views
        end
        
        def render(options=nil, &block)
          response.headers['Status'] = interpret_status((options.is_a?(Hash) && options[:status]) || ::ActionController::Base::DEFAULT_RENDER_STATUS_CODE)

          unless block_given? || render_views?
            if @template.respond_to?(:finder)
              (class << @template.finder; self; end).class_eval do
                define_method :file_exists? do; true; end
              end
            else
              (class << @template; self; end).class_eval do
                define_method :file_exists? do; true; end
              end
            end
            (class << @template; self; end).class_eval do

              define_method :render_file do |*args|
                @first_render ||= args[0] unless args[0] =~ /^layouts/
                @_first_render ||= args[0] unless args[0] =~ /^layouts/
              end

              define_method :_pick_template do |*args|
                @_first_render ||= args[0] unless args[0] =~ /^layouts/
                PickedTemplate.new
              end

            end

          end     

          super(options, &block)
        end

      end

      # Returned by _pick_template when running controller examples in isolation mode.
      class PickedTemplate 
        # Do nothing when running controller examples in isolation mode.
        def render_template(*ignore_args); end
        # Do nothing when running controller examples in isolation mode.
        def render_partial(*ignore_args);  end
      end

      def self.extended(extended_behaviour)
        extended_behaviour.send :include, ::ActionController::TestProcess, InstanceMethods, ::Micronaut::Rails::Matchers::Controllers
        extended_behaviour.describes.send :include, RenderOverrides, ::ActionController::TestCase::RaiseActionExceptions

        extended_behaviour.before do
          @controller = self.class.describes.new
          @controller.request = @request = ::ActionController::TestRequest.new
          @response = ::ActionController::TestResponse.new
          @response.session = @request.session
          
          @controller.params = {}
          @controller.send(:initialize_current_url)          
        end

      end

    end
  end
end