class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  validates :title, presence: true, length: { minimum: 3, maximum: 20 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
