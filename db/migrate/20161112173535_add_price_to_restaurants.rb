class AddPriceToRestaurants < ActiveRecord::Migration[5.0]
  def change
    change_table :restaurants do |t|
     t.integer :price
   end
  end
end
