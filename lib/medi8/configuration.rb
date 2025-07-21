# frozen_string_literal: true

module Medi8
  # Configuration class for Medi8, allowing users to set up middleware and registry.
  class Configuration
    # Initializes a new configuration instance with an empty registry and middleware stack.
    def initialize
      @registry = Medi8::Registry.new
      @middleware_stack = Medi8::MiddlewareStack.new
    end

    attr_reader :registry, :middleware_stack

    # Adds a new middleware registry entry.
    def use(middleware)
      @middleware_stack.use(middleware)
    end
  end
end
