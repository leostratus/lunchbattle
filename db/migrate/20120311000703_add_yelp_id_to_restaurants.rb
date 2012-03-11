class AddYelpIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :yelp_id, :string

  end
end
