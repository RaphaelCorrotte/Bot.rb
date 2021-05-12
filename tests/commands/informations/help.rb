require_relative "../../../lib/bot"

module DiscordBot
  module Commands
    def help
      DiscordBot::Command.new({
                             :name => :help,
                             :aliases => "h",
                             :description => "Affiche le panel d'aide",
                             :args => ["[commande]"],
                             :use_example => :default,
                             :required_permissions => :default,
                             :required_bot_permissions => :default,
                             :category => :default
                           }) do |event, tools|
        if DiscordBot::Utils::get_command((tools[:args][0]).to_s, { :boolean => true })
          command = DiscordBot::Utils::get_command(tools[:args][0])
          command_aliases = if command.aliases.class == Array
                              if command.aliases.empty? false; else
                                (command.aliases.map { |a| "#{$client.config[:prefix]}#{a}" }).join("\n")
                              end
                            elsif command.aliases.class == String
                              "#{$client.config[:prefix]}#{command.aliases}"
                            end

          command_args = if command.args
                           command.args.map { |arg| "#{$client.config[:prefix]}#{command.name}#{arg}" }.join("\n")
                         else false end
          command_required_permissions = if command.required_permissions && !(command.required_permissions.empty?)
                                           command.required_permissions.map { |perm| perm.to_s.upcase }.join(", ")
                                         else false end

          command_required_bot_permissions = if command.required_bot_permissions && !(command.required_bot_permissions.empty?)
                                               command.required_bot_permissions.map { |perm| perm }.join(", ")
                                             else false end

          fields = [
            {
              :name => "• Name",
              :value => command.name
            },
            {
              :name => "• Aliases",
              :value => command_aliases || "no"
            },
            {
              :name => "• Description",
              :value => command.description
            },
            {
              :name => "• Args",
              :value => command_args || "no"
            },
            {
              :name => "• Example",
              :value => command.use_example
            },
            {
              :name => "• Category",
              :value => command.category
            },
            {
              :name => "• User permissions required",
              :value => command_required_permissions || "no"
            },
            {
              :name => "• Bot permissions required",
              :value => command_required_bot_permissions || "no"
            }
          ]
          event.channel.send_embed do |embed|
            DiscordBot::Utils::build_embed(embed)
            DiscordBot::Utils::add_fields(embed, fields, true)
          end
        elsif tools[:args][0] and not DiscordBot::Utils::get_command(tools[:args][0], { :boolean => true })
          event.respond "There isn't any command found with #{tools[:args][0]}"
        else
          event.channel.send_embed do |embed|
            DiscordBot::Utils::build_embed(embed)
            embed.description = $client.commands.map { |cmd| cmd }.join("\n")
          end
        end
      end
    end
    module_function :help
  end
end

