class ChangingLikedToInt < ActiveRecord::Migration
  def change
    change_column :movies, :liked, :int
  end
end
