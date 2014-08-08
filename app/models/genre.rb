class Genre < ActiveRecord::Base
  has_many :details
  has_many :movies, through: :details
end
