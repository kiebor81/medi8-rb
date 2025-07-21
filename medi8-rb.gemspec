# frozen_string_literal: true

require_relative "lib/medi8/version"

Gem::Specification.new do |spec|
  spec.name          = "medi8-rb"
  spec.version       = Medi8::VERSION
  spec.summary       = "Lightweight Ruby/Rails mediator inspired by MediatR"
  spec.description   = "Medi8 is a lightweight, idiomatic mediator pattern implementation for Ruby and Rails, inspired by MediatR (from .NET)" # rubocop:disable Layout/LineLength
  spec.authors       = ["kiebor81"]

  spec.files         = Dir["lib/**/*.rb", "README.md"]
  spec.require_paths = ["lib"]
  spec.homepage      = "https://github.com/kiebor81/medi8-rb"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.0"
  spec.extra_rdoc_files += Dir["sig/**/*.rbs"]
  spec.test_files = Dir["spec/**/*_spec.rb"]
  spec.add_dependency "rails", ">= 6.0"
  spec.add_development_dependency "rspec", "~> 3.12"
end
