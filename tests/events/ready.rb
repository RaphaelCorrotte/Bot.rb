require_relative "../../lib/bot"

module DiscordBot
  module Events
    def ready
      $client.ready do
        DiscordBot::CONSOLE_LOGGER.info("Client login")
        $client.game = "Ruby <3"
      end
    end
    module_function :ready
  end
end
