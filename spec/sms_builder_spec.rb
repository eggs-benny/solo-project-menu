require 'sms_builder'
require 'date'

RSpec.describe SMSBuilder do
  describe "#mob_num" do
    it "returns number as string" do
    sms = SMSBuilder.new("", "07123 456 789")
    expect(sms.mob_num).to eq "07123456789"
    end
  end

  describe "#delivery_time" do
    it "returns the time as HH:MM + 1H" do
    sms = SMSBuilder.new("", "07123 456 789")
    d_time = Time.new(2022, 9, 25, 17, 12)
    expect(sms.delivery_time(d_time)).to eq "18:12"
    end
  end

  describe "#format_sms" do
    it "returns an SMS to send to customer" do
    sms = SMSBuilder.new("", "07123 456 789")
    d_time = Time.new(2022, 9, 25, 17, 12)
    sms.delivery_time(d_time)
    expect(sms.format_sms).to eq "Thank you! Your order was placed and will be delivered before 18:12"
    end
  end
end
