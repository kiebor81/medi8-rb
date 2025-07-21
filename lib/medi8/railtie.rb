# frozen_string_literal: true

module Medi8
  # Railtie for integrating Medi8 with Rails
  class Railtie < Rails::Railtie
    initializer "medi8.load_handlers" do
      ActiveSupport.on_load(:after_initialize) do
        # Auto-load files like app/requests/** and app/handlers/**
        Dir[Rails.root.join("app", "handlers", "**", "*.rb")].each { |file| require file }
        Dir[Rails.root.join("app", "requests", "**", "*.rb")].each { |file| require file }
      end
    end
  end
end
