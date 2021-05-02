require_relative "../app/app"

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
