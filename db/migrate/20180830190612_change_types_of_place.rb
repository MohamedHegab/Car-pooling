class ChangeTypesOfPlace < ActiveRecord::Migration[5.2]
  def change
    change_column :places, :longitude, :float, precision: 4, scale: 3,   null: false, default: ""
    change_column :places, :latitude, :float, precision: 4, scale: 3,   null: false, default: ""

  end
end
