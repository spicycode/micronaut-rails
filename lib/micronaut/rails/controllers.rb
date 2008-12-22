module Micronaut
  module Rails
    module Controllers

      module InstanceMethods
        attr_reader :request, :response, :controller

      end

      module RenderOverrides
        
        def render_views!
          @render_views = true
        end

        def render_views?
          @render_views
        end

        def render(options=nil, deprecated_status_or_extra_options=nil, &block)
          if ::Rails::VERSION::STRING >= '2.0.0' && deprecated_status_or_extra_options.nil?
            deprecated_status_or_extra_options = {}
          end

          unless block_given?
            unless render_views?
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

                define_method :render do |*args|
                  if @_rendered
                    opts = args[0]
                    (@_rendered[:template] ||= opts[:file]) if opts[:file]
                    (@_rendered[:partials][opts[:partial]] += 1) if opts[:partial]
                  else
                    super
                  end
                end
                              
              end

              (class << response; self; end).class_eval do
                define_method :rendered_template do
                  return options[:action] if options.has_key?(:action)
                  nil
                end
              end
          
            end
          end

          # Just let render :text => 'whatever' fall through
          types_that_require_render = (options && options.has_key?(:text))
          
          if render_views? || types_that_require_render
            super(options, deprecated_status_or_extra_options, &block)
          else
            @performed_render = true
          end
        end

      end

      # Returned by _pick_template when running controller examples in isolation mode.
      class PickedTemplate 
        # Do nothing when running controller examples in isolation mode.
        def render_template(*ignore_args); end
        # Do nothing when running controller examples in isolation mode.
        def render_partial(*ignore_args);  end
      end

      def self.extended(kls)
        kls.send(:include, ActionController::TestProcess)
        kls.send(:include, InstanceMethods)
        kls.send(:include, Micronaut::Rails::Matchers::Controllers)

        kls.before do
          @controller.class.send :include, ActionController::TestCase::RaiseActionExceptions
          @controller = self.class.described_type.new
          @request = ActionController::TestRequest.new
          @controller.request = @request
          @response = ActionController::TestResponse.new
          @controller.params = {}
          @controller.send(:initialize_current_url)
          @response.session = @request.session
          # Place some methods in the meta class to stand in
          # front of ActionController::Base
          (class << @controller; self; end).class_eval do
            include RenderOverrides
          end
        end



      end

    end
  end
end
