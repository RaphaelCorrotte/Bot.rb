require_relative "../app/app"

module DiscordBot
  module Events
    def message
      $client.message(start_with: $client.config[:prefix]) do |event|
        args = event.content.slice($client.config[:prefix].size, event.content.size).split(" ")
        next unless event.content.start_with?($client.config[:prefix])
        if $client.commands.include?(args[0])
          DiscordBot::Commands.method(args[0]).call(event)[:run].call
        end
      end
    end
    module_function :message
  end
end

