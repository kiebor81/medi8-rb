# frozen_string_literal: true

module Medi8
  # This job is used to handle notifications in Medi8.
  module Jobs
    # NotificationJob is an ActiveJob that processes notifications.
    class NotificationJob < ActiveJob::Base
      queue_as :default

      # Perform the job with the given handler class name, event hash, and event class name.
      def perform(handler_class_name, event_hash, event_class_name)
        handler = handler_class_name.constantize.new
        event = event_class_name.constantize.new(**event_hash.symbolize_keys)
        handler.call(event)
      end
    end
  end
end
