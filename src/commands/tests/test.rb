require_relative "../../app/app"

module DiscordBot
  module Commands
    def test(event)
      DiscordBot::Command.command({ :name => "test" }, event) do
        event.respond("test")
      end
    end
    module_function :test
  end
end