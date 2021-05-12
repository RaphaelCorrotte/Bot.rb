require_relative "../../../lib/bot"

module DiscordBot
  module Commands
    def test
      DiscordBot::Command.new({ :name => "test" }) do |event, tools|
        event.respond("Test!")
      end
    end
    module_function :test
  end
end