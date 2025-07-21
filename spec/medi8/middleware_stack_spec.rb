# spec/medi8/middleware_stack_spec.rb
RSpec.describe Medi8::MiddlewareStack do
  let(:stack) { described_class.new }

  class TestMiddleware
    def call(req)
      req[:trace] << :middleware
      yield
    end
  end

  it "wraps execution in middleware layers" do
    req = { trace: [] }
    stack.use TestMiddleware
    result = stack.call(req) { req[:trace] << :handler }
    expect(req[:trace]).to eq([:middleware, :handler])
  end
end
