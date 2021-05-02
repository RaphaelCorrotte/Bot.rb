module DiscordBot
  module CommandHandler
    def load_commands
      commands = []
      dirs =  Dir.entries("src/commands")
      dirs.each do |dir|
        next if dir == "." || dir == ".."
        Dir.entries("src/commands/#{dir}").each do |file|
          next if file == "." || file == ".."
          load "src/commands/#{dir}/#{file}"
          commands << File.basename(file, ".rb")
        end
      end
      commands
    end
    module_function :load_commands
  end
end
