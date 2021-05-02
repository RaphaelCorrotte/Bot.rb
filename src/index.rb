require_relative "app/app"

$client.commands = DiscordBot::CommandHandler.load_commands
events = DiscordBot::EventHandler.load_events

events.each do |evt|
  DiscordBot::Events.method(evt).call
end

begin
  $client.run
rescue DiscordBot::DiscordBotError => e
  DiscordBot::CONSOLE_LOGGER.error(e.message)
end