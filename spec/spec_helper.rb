# frozen_string_literal: true

require "bundler/setup"
require "medi8"
require "active_support"
require "active_job"
require "zeitwerk"

RSpec.configure do |config|
  config.order = :random
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
