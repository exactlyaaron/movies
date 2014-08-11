class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.references :director_details
      t.string :name
    end
  end
end
