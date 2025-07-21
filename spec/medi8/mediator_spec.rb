# spec/medi8/mediator_spec.rb
RSpec.describe Medi8::Mediator do
  let(:registry) { Medi8::Registry.new }
  let(:request_class) { Class.new { attr_reader :val; def initialize(val:); @val = val; end } }
  let(:handler_class) { Class.new { def call(req); "got #{req.val}"; end } }

  it "dispatches a request to its handler" do
    registry.register(request_class, handler_class)
    result = described_class.new(registry).send(request_class.new(val: "x"))
    expect(result).to eq("got x")
  end
end
