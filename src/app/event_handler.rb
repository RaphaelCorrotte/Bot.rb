module DiscordBot
  module EventHandler
    def load_events
      events = []
      dir = Dir.entries("src/events/")
      dir.each do |file|
        next if file == "." || file == ".."
        load "src/events/#{file}"
        events << File.basename(file, ".rb")
      end
      events
    end
    module_function :load_events
  end
end
