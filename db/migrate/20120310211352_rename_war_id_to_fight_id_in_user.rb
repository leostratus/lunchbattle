class RenameWarIdToFightIdInUser < ActiveRecord::Migration
  def change
    rename_column :users, :war_id, :fight_id
  end
end
