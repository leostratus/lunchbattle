class ChangeDefaultsForFights < ActiveRecord::Migration
  def change
    change_column_default :fights, :votes_for_1, 0
    change_column_default :fights, :votes_for_2, 0
  end
end
