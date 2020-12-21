SlackRubyBotServer::Events.configure do |config|
  config.on :event do |event|
    event.logger.info "#{event[:event][:user]}"

    slack_client = Slack::Web::Client.new(token: ENV['SLACK_BOT_USER_ACCESS_TOKEN'])
    
    if !event[:event][:bot_id]
      if event[:event][:text] =~ /^\d+\ ?\+\ ?\d+$/

        msg = event[:event][:text]
        
        num1, num2 = msg.split('+')
        result = num1.to_i + num2.to_i
        
        bot_msg = "#{msg} = #{result}"
        slack_client.chat_postMessage(channel: event[:event][:channel], text: "#{bot_msg}")
      else
        slack_client.chat_postMessage(channel: event[:event][:channel], text: "Sorry, I didn't understand that. I only add numbers in this format. eg: 5+6 or 6+3")
      end
    end

    { ok: true }
  end
end
