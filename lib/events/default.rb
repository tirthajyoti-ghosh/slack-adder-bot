require_relative '../logic'

SlackRubyBotServer::Events.configure do |config|
  config.on :event do |event|
    event.logger.info "#{event}"
    team = Team.where(team_id: event[:event][:team]).first || raise("Cannot find team with ID #{event[:event][:team]}.")

    slack_client = Slack::Web::Client.new(token: team.token)
    
    if !event[:event][:bot_id]
      slack_client.chat_postMessage(channel: event[:event][:channel], text: BotUser.new.say(event[:event][:text]))
    end

    { ok: true }
  end
end
