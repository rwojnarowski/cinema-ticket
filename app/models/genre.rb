class Genre < ActiveRecord::Base
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  validates :genre, presence: true, length: { minimum: 3, maximum: 20 }
end
