# frozen_string_literal: true

# This file is part of the mock_e2e test example
class TrackRegistrationHandler
  include Medi8::NotificationHandler

  subscribes_to UserRegistered

  def call(event)
    puts "=> Tracking user registration for ID #{event.user_id}"
  end
end
