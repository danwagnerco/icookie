class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :zip
      t.string :state
      t.string :city
      t.string :county
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
