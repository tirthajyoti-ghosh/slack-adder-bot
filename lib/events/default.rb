require_relative '../logic'

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
