class ChangeRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :response, :text
    remove_column :restaurants, :name
    remove_column :restaurants, :rating
  end
end
