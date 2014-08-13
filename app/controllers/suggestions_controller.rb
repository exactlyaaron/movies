require_relative "../models/genre.rb"
require_relative "../models/genre_details.rb"

class SuggestionsController

  attr_accessor :movie
  INTEGER_ABOVE_ZERO = /^[1-9][0-9]*$/

  def get_prompt
    command = clean_gets
    case command
    when "1"
      puts "\nType a genre that you enjoy:"
      get_genre_suggestions
    when "2"
      puts "\nType the name of a director you enjoy:"
      get_director_suggestions
    else
      puts "I don't know the '#{command}' command."
      exit
    end
  end

  def get_genre_suggestions
    input = clean_gets
    puts "\nHere are suggestions based on your input of '#{input}'"

    genre = Genre.where(name: input).first.id
    genre_details = GenreDetail.where(genre_id: genre)
    movies = []
    genre_details.each do |i|
      movies << Movie.where(id: i.movie_id).first
    end
    random_movies = movies.sample(3)
    random_movies.each_with_index do |movie, i|
      puts "#{i+1}. #{movie.name}"
    end
  end

  def get_director_suggestions
    input = clean_gets
    puts "\nHere are suggestions based on your input of '#{input}'"

    director = Director.where(name: input).first.id
    director_details = DirectorDetail.where(director_id: director)
    movies = []
    genre_details.each do |i|
      movies << Movie.where(id: i.movie_id).first
    end
    random_movies = movies.sample(3)
    random_movies.each_with_index do |movie, i|
      puts "#{i+1}. #{movie.name}"
    end
  end

end
