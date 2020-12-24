SlackRubyBotServer.configure do |config|
  config.oauth_version = :v2
  config.oauth_scope = ['users:read', 'channels:read', 'groups:read',
                        'chat:write', 'commands', 'im:history', 'incoming-webhook']
end
