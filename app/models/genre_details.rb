class GenreDetail < ActiveRecord::Base
  belongs_to :movie
  belongs_to :genre
end
