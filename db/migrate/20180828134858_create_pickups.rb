class CreatePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :pickups do |t|
      t.integer :passenger_id,           null: false
      t.integer :source_id,              null: false
      t.integer :destination_id,         null: false
      t.datetime :departure_time

      t.timestamps
    end

    add_index(:pickups, [ :passenger_id, :source_id, :destination_id ])
  end
end
