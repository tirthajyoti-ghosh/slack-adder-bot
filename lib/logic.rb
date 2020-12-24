class BotUser
  def say(msg)
    if msg_valid?(msg)
      add_from(msg)
    else
      "Sorry, I didn't understand that. I only add numbers in this format. eg: 5+6 or 6+3"
    end
  end

  private

  def msg_valid?(msg)
    msg =~ /^\d+\ ?\+\ ?\d+$/
  end

  def add_from(msg)
    num1, num2 = msg.split('+')
    result = num1.to_i + num2.to_i

    "#{msg} = #{result}"
  end
end
