require_relative "../models/genre.rb"
require_relative "../models/genre_details.rb"

class MoviesController

  attr_accessor :movie
  INTEGER_ABOVE_ZERO = /^[1-9][0-9]*$/

  def add
    puts "\n"
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
  end

  def add_plot(movie)
    puts "\n"
    puts "----------------------------------------------"
    puts "Write a short summary of the plot"
    puts "----------------------------------------------"
    plot = clean_gets
    movie.update(plot: plot)
    add_genre(movie)
  end

  def add_genre(movie)
    puts "\n"
    puts "----------------------------------------------------------"
    puts "Specify genre(s) separated by commas. Ex: 'Action, Comedy'"
    puts "----------------------------------------------------------"
    genres = clean_gets
    movie.add_genres(genres)
    movie.save
    add_director(movie)
  end

  def add_director(movie)
    puts "\n"
    puts "----------------------------------------------------------------------"
    puts "Specify director(s) separated by commas. Ex: 'Guy Ritchie, James Gunn'"
    puts "----------------------------------------------------------------------"
    directors = clean_gets
    movie.add_directors(directors)
    movie.save
    puts "Movie has been added to the database."
  end

  def list
    puts "\n"
    puts "------------------------------------------------------"
    puts "FULL MOVIE LIST - Enter a number to view movie details"
    puts "------------------------------------------------------"
    Movie.all.each_with_index do |movie, i|
      puts "#{i+1}. #{movie.name}"
    end
    show_movie
  end

  def show_movie
    selection = clean_gets
    case selection
      when INTEGER_ABOVE_ZERO
        if selection.to_i > Movie.all.length
          puts "That number is not in the list."
          exit
        end
        movie = Movie.find_by id: selection
        genre_string = movie.genres.map(&:name).join(', ')
        director_string = movie.directors.map(&:name).join(', ')
        puts "\n\n#{movie.name.upcase}"
        puts "========================"
        puts "Genre(s): #{genre_string}"
        puts "Director(s): #{director_string}\n"
        puts "Plot Summary:"
        puts "#{movie.plot}"
      else
        puts "I don't know the '#{selection}' command."
        exit
    end
  end

end
