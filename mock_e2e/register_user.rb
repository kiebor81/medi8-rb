# frozen_string_literal: true

# This file is part of the mock_e2e test example
class RegisterUser
  attr_reader :email

  def initialize(email:)
    @email = email
  end
end
