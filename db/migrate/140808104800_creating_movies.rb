class CreatingMovies < ActiveRecord::Migration
  def change
    # In our original implementation we used:
    # "CREATE TABLE IF NOT EXISTS training_paths(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(29))"
    create_table :movies do |t|
      t.references :genre_details
      t.string :name
    end
  end
end
