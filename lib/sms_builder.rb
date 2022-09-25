require 'date'

class SMSBuilder
  def initialize(time, mob_num)
    @time = time
    @mob_num = mob_num
  end

  def mob_num
    @mob_num.delete(" ")
  end
  
  def delivery_time(time)
    # time = Time.new
    time_plus_hour = time + 60*60
    @time = time_plus_hour.strftime("%H:%M")
  end

  # def get_mobile_no(mob_num)
  #   # gets number
  #   # returns as string
  # end

  def format_sms
    @time
    return "Thank you! Your order was placed and will be delivered before #{@time}"
  end

  def send_sms
    # takes sms and sends via twilio
    # MUST HIDE NUMBERS FROM TWILIO
  end
end