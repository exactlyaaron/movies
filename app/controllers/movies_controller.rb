require_relative "../models/genre.rb"
require_relative "../models/genre_details.rb"

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
    add_genre(movie)
  end

  def add_genre(movie)
    puts "----------------------------------------------------------"
    puts "Specify genre(s) separated by commas. Ex: 'Action, Comedy'"
    puts "----------------------------------------------------------"
    genres = clean_gets
    genre_array = genres.split(',')
    genre_array.each do |word|
      word.strip!
      genre = Genre.create(name: word)
      movie.genres << genre
    end
    puts "Movie has been added to the database."
  end

end
