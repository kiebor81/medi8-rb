# spec/medi8_spec.rb
RSpec.describe Medi8 do
  let(:request_class) { Class.new { attr_reader :value; def initialize(value:); @value = value; end } }
  let(:handler_class) {
    Class.new do
      def call(req); "handled #{req.value}"; end
    end
  }

  it "registers and sends a request to a handler" do
    Medi8.registry.register(request_class, handler_class)
    request = request_class.new(value: "test")
    expect(Medi8.send(request)).to eq("handled test")
  end
end
