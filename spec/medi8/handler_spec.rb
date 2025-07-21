RSpec.describe Medi8::Handler do
  it "registers a handler for a request class" do
    request_class = Struct.new(:value, keyword_init: true)

    handler_class = Class.new do
      include Medi8::Handler

      # The constant must be defined *inside* the test where the request_class is in scope
      handles request_class

      def call(req)
        "Handled #{req.value}"
      end
    end

    expect(Medi8.registry.find_handler_for(request_class)).to eq(handler_class)
  end
end
