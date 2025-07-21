# frozen_string_literal: true

module Medi8
  # Mediator is the main entry point for handling requests and publishing events.
  class Mediator
    def initialize(registry)
      @registry = registry
    end

    # Sends a request to the appropriate handler.
    def send(request)
      handler_class = @registry.find_handler_for(request.class)
      raise "No handler registered for #{request.class}" unless handler_class

      final = -> { handler_class.new.call(request) }

      if defined?(Medi8.middleware_stack)
        Medi8.middleware_stack.call(request, &final)
      else
        final.call
      end
    end

    # Publishes an event to all registered subscribers.
    def publish(event)
      NotificationDispatcher.new(@registry).publish(event)
    end
  end
end
