require "discordrb"
require "json"
require "yaml"
require_relative "bot"
require_relative "logger"
require_relative "error"
require_relative "command_handler"
require_relative "event_handler"
require_relative "command"

module DiscordBot
  include Discordrb
  include JSON
  include YAML
  CONSOLE_LOGGER = Logger.new(:console)
  FILE_LOGGER = Logger.new(:file)
end

module DiscordBot::Commands
  include DiscordBot::Command
end

$discord_bot = DiscordBot::Client.new(YAML.load(File.read("src/private/data.yml"))[:token])
$client = $discord_bot.client
