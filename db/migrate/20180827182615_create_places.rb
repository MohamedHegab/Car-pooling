class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name,              null: false, unique: true
      t.integer :longitude,        null: false
      t.integer :latitude,         null: false

      t.timestamps
    end

    add_index :places, [:longitude, :latitude], unique: true
  end
end
