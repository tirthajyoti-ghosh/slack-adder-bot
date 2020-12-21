SlackRubyBotServer::Events.configure do |config|
  config.on :event do |event|
    event.logger.info "#{event[:event][:user]}"

    slack_client = Slack::Web::Client.new(token: ENV['SLACK_BOT_USER_ACCESS_TOKEN'])
    
    if !event[:event][:bot_id]
      slack_client.chat_postMessage(channel: event[:event][:channel], text: BotUser.new.say(event[:event][:text]))
    end

    { ok: true }
  end
end

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
