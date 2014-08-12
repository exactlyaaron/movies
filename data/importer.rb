# Run from project root via. `ruby data/importer.rb`
require_relative '../lib/environment'
require 'active_record'

require 'csv'
require_relative '../app/models/movie'
require_relative '../app/models/genre'
require_relative '../app/models/director'


Environment.environment = "development"
source = "data/movie_list.csv"

def make_movie(name, plot, genres, directors)
  movie = Movie.create(name: name, plot: plot)
  genres.each do |g|
    g.strip!
    genre = Genre.find_or_create_by(name: g)
    movie.genres << genre
    movie.save
  end

  directors.each do |d|
    d.strip!
    director = Director.find_or_create_by(name: d)
    movie.directors << director
    movie.save
  end
end


CSV.foreach(source, headers: true) do |row|
  movie_name = row['movie title']
  movie_plot = row['movie plot']
  movie_genres = row['movie genres'].split(',')
  movie_directors = row['movie directors'].split(',')

  movie = Movie.all.find{ |movie| movie.name == movie_name }

  movie ||= make_movie(movie_name, movie_plot, movie_genres, movie_directors)

  puts "Imported #{movie_name}."
end
