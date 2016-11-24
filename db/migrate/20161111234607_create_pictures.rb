class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :url
      t.string :description
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
