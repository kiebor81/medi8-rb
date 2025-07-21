# frozen_string_literal: true

module Medi8
  # The Handler module is used to define classes that can handle specific types of requests.
  module Handler
    # This method is called when the module is included in a class.
    def self.included(base)
      base.extend(ClassMethods)
    end

    # This method is used to register a handler for a specific request class.
    module ClassMethods
      def handles(request_class)
        Medi8.registry.register(request_class, self)
      end
    end
  end
end
