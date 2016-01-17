class MovieSearch < ActiveRecord::Base
  def movies
    @movies ||= find_movies
  end

private
  def find_movies

    movies = Movie.order(:title)
    genre = Genre.all
    movies = movies.where("title like ?", "%#{keywords}%") if keywords.present?
    movies = movies.where("genre.id = ?", genre_id) if genre_id.present?
    movies
  end
end
