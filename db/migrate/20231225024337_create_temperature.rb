class CreateTemperature < ActiveRecord::Migration[6.0]
  def change
    create_table :temperatures do |t|
      t.integer :location_id, null: false
      t.integer :timestamp, null: false
      t.float :celsius, null: false

      t.timestamps
    end

    add_index :temperatures, [:location_id, :timestamp], unique: true
  end
end
