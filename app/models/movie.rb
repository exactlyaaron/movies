require_relative "genre.rb"

class Movie < ActiveRecord::Base
  has_many :genre_details
  has_many :genres, through: :genre_details

  has_many :director_details
  has_many :directors, through: :director_details

  validates_length_of :name, maximum: 30, message: "must be less than 30 characters", on: :create
  validates_presence_of :name
  validates_uniqueness_of :name, message: "already exists"

  validates_presence_of :plot, on: :update

  def add_genres(genres)
    genre_array = genres.split(',')
    genre_array.each do |word|
      word.strip!

      genre = Genre.find_or_create_by(name: word)
      self.genres << genre
    end
  end

  def add_directors(directors)
    director_array = directors.split(',')
    director_array.each do |word|
      word.strip!

      director = Director.find_or_create_by(name: word)
      self.directors << director
    end
  end
end
