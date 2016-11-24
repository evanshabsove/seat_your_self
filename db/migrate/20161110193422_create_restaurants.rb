class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string  :name
      t.integer :max_seats
      t.string  :location
      t.string  :cuisine
      t.integer :open_time, :close_time
      t.integer :score
      t.integer :owner_id
      # t.boolean :cash

      t.timestamps
    end
  end
end
