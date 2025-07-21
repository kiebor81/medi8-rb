# frozen_string_literal: true

module Medi8
  # Medi8 Notifications Module
  module NotificationHandler
    def self.included(base)
      base.extend ClassMethods
    end

    # Registers a class as a notification handler for a specific event class.
    module ClassMethods
      def subscribes_to(event_class, async: false)
        Medi8.registry.register_notification(event_class, self, async: async)
      end
    end
  end

  # Medi8 Notification dispatcher
  class NotificationDispatcher
    def initialize(registry)
      @registry = registry
    end

    # Publishes an event to all registered handlers for that event class.
    def publish(event) # rubocop:disable Metrics/MethodLength
      handlers = @registry.find_notification_handlers_for(event.class)
      handlers.each do |handler_def|
        handler_class, async = handler_def

        if async
          Medi8::Jobs::NotificationJob.perform_later(
            handler_class.name,
            event.instance_variables.to_h { |var| [var.to_s.delete("@"), event.instance_variable_get(var)] },
            event.class.name
          )
        else
          handler_class.new.call(event)
        end
      end
    end
  end
end
