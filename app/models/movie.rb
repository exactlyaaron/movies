class Movie < ActiveRecord::Base
  has_many :genre_details
  has_many :genres, through: :genre_details

  validates_length_of :name, maximum: 30, message: "must be less than 30 characters"
  validates_presence_of :name
  validates_uniqueness_of :name, message: "already exists"
end
