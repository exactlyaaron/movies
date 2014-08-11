class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.references :genre_details
      t.string :name
    end
  end
end
