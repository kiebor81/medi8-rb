# spec/medi8/registry_spec.rb
RSpec.describe Medi8::Registry do
  let(:registry) { described_class.new }
  let(:request_class) { Class.new }
  let(:handler_class) { Class.new }

  it "registers and retrieves a handler" do
    registry.register(request_class, handler_class)
    expect(registry.find_handler_for(request_class)).to eq(handler_class)
  end

  it "registers and retrieves notification handlers" do
    registry.register_notification(String, handler_class)
    expect(registry.find_notification_handlers_for(String)).to include([handler_class, false])
  end
end
