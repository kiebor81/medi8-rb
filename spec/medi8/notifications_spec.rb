RSpec.describe Medi8::NotificationHandler do
  it "registers and executes notification handlers" do
    event_class = Struct.new(:data, keyword_init: true)

    Class.new do
      include Medi8::NotificationHandler
      subscribes_to event_class

      def call(event)
        event.data << :called
      end
    end

    data = []
    event = event_class.new(data: data)
    Medi8.publish(event)

    expect(data).to include(:called)
  end
end
