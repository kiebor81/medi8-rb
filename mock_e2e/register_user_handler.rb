# frozen_string_literal: true

# This file is part of the mock_e2e test example
class RegisterUserHandler
  include Medi8::Handler

  handles RegisterUser

  def call(command)
    puts "=> Registering user: #{command.email}"
    user_id = rand(1000..9999)
    Medi8.publish(UserRegistered.new(user_id: user_id, email: command.email))
    "User #{command.email} registered with ID #{user_id}"
  end
end
