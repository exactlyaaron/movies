class MoviesController

  attr_accessor :movie

  def add
    puts "----------------------------------------------"
    puts "What is the name of the movie you want to add?"
    puts "----------------------------------------------"
    name = clean_gets
    @movie = Movie.create(name: name)
    if movie.new_record?
      puts movie.errors.full_messages
    else
      add_plot(@movie)
    end
  end

  def add_plot(movie)
    puts "----------------------------------------------"
    puts "Write a short summary of the plot"
    puts "----------------------------------------------"
    plot = clean_gets
    movie.update(plot: plot)
    puts "Movie has been added to the database."
  end

end
