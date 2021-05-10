require_relative "../../app/app"

module DiscordBot
  module Commands
    def test
      Discordbot::Command.new({ :name => "test" }) do |event, tools|
        event.respond("Test!")
      end
    end
    module_function :test
  end
end