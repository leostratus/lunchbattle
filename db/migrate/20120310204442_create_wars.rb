class CreateWars < ActiveRecord::Migration
  def change
    create_table :wars do |t|
      t.integer :restaurant_1_id
      t.integer :restaurant_2_id
      t.integer :votes_for_1
      t.integer :votes_for_2

      t.timestamps
    end
  end
end
