class Router
  def self.navigate_main_menu
    command = clean_gets
    case command
    when "1"
      puts "\n--------------------------"
      puts "Your list of liked movies:"
      puts "--------------------------"
      movies_controller = MoviesController.new()
      movies_controller.list_liked
    when "2"
      puts "\n------------------------"
      puts "Get suggestions based on:"
      puts "1. Genre"
      puts "2. Director"
      suggestions_controller = SuggestionsController.new()
      suggestions_controller.get_prompt
    when "3"
      movies_controller = MoviesController.new()
      movies_controller.list
    when "4"
      movies_controller = MoviesController.new()
      movies_controller.add
    else
      puts "I don't know the '#{command}' command."
    end
  end
end
