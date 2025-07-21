# frozen_string_literal: true

# This file is part of the mock_e2e test example
class UserRegistered
  attr_reader :user_id, :email

  def initialize(user_id:, email:)
    @user_id = user_id
    @email = email
  end
end
