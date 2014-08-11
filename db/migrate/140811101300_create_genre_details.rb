class CreateGenreDetails < ActiveRecord::Migration
  def change
    create_table :genre_details do |t|
      t.references :genre
      t.references :movie
    end
  end
end
