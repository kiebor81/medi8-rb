# frozen_string_literal: true

module Medi8
  # Registry for managing request handlers and event notifications
  class Registry
    def initialize
      @handlers = {}
    end

    # Singleton instance of the Registry
    def register(request_class, handler_class)
      @handlers[request_class] = handler_class
    end

    # Find the handler for a given request class
    def find_handler_for(request_class)
      @handlers[request_class]
    end

    # Register a notification event and its handler
    def register_notification(event_class, handler_class, async: false)
      @notifications ||= Hash.new { |h, k| h[k] = [] }
      @notifications[event_class] << [handler_class, async]
    end

    # Find all handlers for a given notification event class
    def find_notification_handlers_for(event_class)
      (@notifications && @notifications[event_class]) || []
    end
  end
end
