class Director < ActiveRecord::Base
  has_many :director_details
  has_many :movies, through: :director_details

  validates_length_of :name, maximum: 30, message: "must be less than 30 characters"
  validates_presence_of :name
  validates_uniqueness_of :name, message: "already exists"
end
