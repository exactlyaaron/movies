class CreateDirectorDetails < ActiveRecord::Migration
  def change
    create_table :director_details do |t|
      t.references :director
      t.references :movie
    end
  end
end
