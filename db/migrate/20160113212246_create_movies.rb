class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :time

      t.timestamps null: false
    end
  end
end
