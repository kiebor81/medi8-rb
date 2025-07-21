# spec/medi8/configuration_spec.rb
RSpec.describe Medi8::Configuration do
  it "exposes registry and middleware stack" do
    config = described_class.new
    expect(config.registry).to be_a(Medi8::Registry)
    expect(config.middleware_stack).to be_a(Medi8::MiddlewareStack)
  end

  it "accepts middleware via use" do
    mw = Class.new
    config = described_class.new
    config.use(mw)
    expect(config.middleware_stack.instance_variable_get(:@middlewares)).to include(mw)
  end
end
