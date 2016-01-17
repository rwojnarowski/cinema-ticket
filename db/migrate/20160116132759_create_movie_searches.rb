class CreateMovieSearches < ActiveRecord::Migration
  def change
    create_table :movie_searches do |t|
      t.string :keywords
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
