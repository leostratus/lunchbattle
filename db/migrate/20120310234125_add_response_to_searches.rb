class AddResponseToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :response, :text
  end
end
