class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :chairman
      t.text :info

      t.timestamps
    end
  end
end
