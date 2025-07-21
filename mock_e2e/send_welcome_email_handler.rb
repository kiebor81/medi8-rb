# frozen_string_literal: true

# This file is part of the mock_e2e test example
class SendWelcomeEmailHandler
  include Medi8::NotificationHandler

  subscribes_to UserRegistered

  def call(event)
    puts "=> Sending welcome email to #{event.email} (User ID: #{event.user_id})"
  end
end
