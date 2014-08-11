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
      puts "Name #{movie.errors[:name][0]}"
    else
      add_plot(@movie)
    end
    # movie.errors.nil? ? add_plot(@movie) : (puts "Name #{movie.errors[:name][0]}")
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
    movie.add_genres(genres)
    movie.save
    add_director(movie)
  end

  def add_director(movie)
    puts "----------------------------------------------------------------------"
    puts "Specify director(s) separated by commas. Ex: 'Guy Ritchie, James Gunn'"
    puts "----------------------------------------------------------------------"
    directors = clean_gets
    movie.add_directors(directors)
    movie.save
    puts "Movie has been added to the database."
  end

end
