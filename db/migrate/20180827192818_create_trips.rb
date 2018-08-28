class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :driver_id,              null: false
      t.integer :source_id,              null: false
      t.integer :destination_id,         null: false
      t.datetime :departure_time
      t.integer :number_of_seats,        null: false, default: 3

      t.timestamps
    end

    add_index(:trips, [ :driver_id, :source_id, :destination_id ])
  end
end
