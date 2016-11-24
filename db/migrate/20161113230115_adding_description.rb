class AddingDescription < ActiveRecord::Migration[5.0]
  def self.up
   add_column :restaurants, :description, :text
 end

 def self.down
   remove_column :restaurants, :description
 end
end
