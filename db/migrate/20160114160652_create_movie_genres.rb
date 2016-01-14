class CreateMovieGenres < ActiveRecord::Migration
  def change
    create_table :movie_genres do |t|
      t.integer :genre_id
      t.integer :movie_id
    end
  end
end
