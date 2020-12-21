SlackRubyBotServer::Events.configure do |config|
  config.on :event do |event|
    event.logger.info "#{event[:event][:user]}"

    slack_client = Slack::Web::Client.new(token: ENV['SLACK_BOT_USER_ACCESS_TOKEN'])
    
    if !event[:event][:bot_id]
      msg = event[:event][:text]

      n1, n2 = msg.split('+')
      result = n1.to_i + n2.to_i

      bot_msg = "#{msg} = #{result}"
      slack_client.chat_postMessage(channel: event[:event][:channel], text: "#{bot_msg}")
    end

    { ok: true }
  end
end
