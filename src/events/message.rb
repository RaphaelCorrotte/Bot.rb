require_relative "../app/app"

module DiscordBot
  module Events
    def message
      $client.message(start_with: $client.config[:prefix]) do |event|
        args = event.content.slice($client.config[:prefix].size, event.content.size).split(" ")
        next unless event.content.start_with?($client.config[:prefix])
        name = args.shift
        if DiscordBot::Utils::get_command(name, { :boolean => true })
          begin
            command = DiscordBot::Utils::get_command(name)
            command.run.call(event, { :args => args })
          rescue => e
            CONSOLE_LOGGER.error("Error running #{name}: #{e.message}")
            FILE_LOGGER.write(e.message, :errors)
          else
            CONSOLE_LOGGER.info("Command #{name} executed")
          end
        end
      end
    end
    module_function :message
  end
end