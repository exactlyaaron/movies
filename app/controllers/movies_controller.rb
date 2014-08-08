class MoviesController

  def add
    puts "----------------------------------------------"
    puts "What is the name of the movie you want to add?"
    puts "----------------------------------------------"
    name = clean_gets
    movie = Movie.create(name: name)
    if movie.new_record?
      puts movie.errors.full_messages
    else
      puts "#{name} has been added to the list of movies."
    end
  end

end
