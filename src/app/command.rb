module DiscordBot
  module Command
    def command(props, event, &run)
      {
        :props => props,
        :event => event,
        :run => run
      }
    end
    module_function :command
  end
end