class AddingLikesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :liked, :boolean
    remove_column :movies, :genre_details_id
  end
end
