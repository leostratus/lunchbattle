class RenameWarsToFights < ActiveRecord::Migration
  def change
      rename_table :wars, :fights
  end
end
