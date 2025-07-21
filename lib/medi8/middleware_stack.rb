# frozen_string_literal: true

module Medi8
  # MiddlewareStack is a stack of middleware that can be used to process requests.
  class MiddlewareStack
    # Initializes a new MiddlewareStack.
    def initialize
      @middlewares = []
    end

    # Adds a middleware to the stack.
    def use(middleware)
      @middlewares << middleware
    end

    # Calls the middlewares in reverse order, passing the request and a final block.
    def call(request, &final)
      @middlewares.reverse.inject(final) do |next_middleware, middleware|
        -> { middleware.new.call(request, &next_middleware) }
      end.call
    end
  end
end
