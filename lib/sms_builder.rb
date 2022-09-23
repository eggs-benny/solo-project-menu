class SMSBuilder
  def initializer(time, mob_num)
  end

  def time
   # return time
  end

  def mob_num
   # return mob_num
  end
  
  def get_time(time)
    # trawl from time API
  end

  def get_mobile_no(mob_num)
    # gets number
    # returns as string
  end

  def format_sms
    # combines time & mob_numb to "Thank you! Your order was placed and will be delivered before HH:MM"
    # MUST HIDE NUMBERS
  end

  def send_sms
    # takes sms and sends via twilio
    # MUST HIDE NUMBERS FROM TWILIO
  end
end