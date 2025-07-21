# frozen_string_literal: true

require_relative "medi8/version"
require_relative "medi8/registry"
require_relative "medi8/mediator"
require_relative "medi8/handler"
require_relative "medi8/railtie" if defined?(Rails)
require_relative "medi8/configuration"
require_relative "medi8/middleware_stack"
require_relative "medi8/notifications"

# Medi8 is a lightweight event-driven framework for Ruby applications.
module Medi8
  class << self
    # Configures the Medi8 framework.
    def configure
      yield configuration
    end

    # Returns the current configuration for Medi8.
    def configuration
      @configuration ||= Medi8::Configuration.new
    end

    # Provides a convenient way to access the Mediator instance.
    def send(request)
      Mediator.new(registry).send(request)
    end

    # Publishes an event to the Mediator, which will notify all registered handlers.
    def publish(event)
      Mediator.new(registry).publish(event)
    end

    # Returns the registry instance used by Medi8.
    def registry
      configuration.registry
    end

    # Returns the middleware stack used by Medi8.
    def middleware_stack
      configuration.middleware_stack
    end

    # Adds a middleware to the Medi8 middleware stack.
    def use(middleware)
      middleware_stack.use(middleware)
    end
  end
end
