# frozen_string_literal: true

require_relative "mock_e2e/boot"

puts "=== START MOCK FLOW ==="
response = Medi8.send(RegisterUser.new(email: "user@example.com"))
puts " Handler Result: #{response}"
puts "=== END MOCK FLOW ==="
