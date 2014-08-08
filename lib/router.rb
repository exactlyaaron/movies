class Router
  # def self.navigate_training_paths_menu(training_paths_controller)
  #   command = clean_gets
  #   case command
  #   when "add"
  #     training_paths_controller.add
  #   when /\d+/
  #     training_paths_controller.view(command.to_i)
  #   else
  #     puts "I don't know the '#{command}' command."
  #   end
  # end

  def self.navigate_main_menu
    command = clean_gets
    case command
    when "1"
      puts "you typed 1"
    when "2"
      puts "you typed 2"
    when "3"
      puts "you typed 3"
    when "4"
      movies_controller = MoviesController.new()
      movies_controller.add
    else
      puts "I don't know the '#{command}' command."
    end
  end
end
