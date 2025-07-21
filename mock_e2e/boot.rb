# frozen_string_literal: true

require_relative "../lib/medi8"
require_relative "register_user"
require_relative "register_user_handler"
require_relative "user_registered"
require_relative "send_welcome_email_handler"
require_relative "track_registration_handler"

Medi8.configure do |config|
  # Optionally add middleware
end
