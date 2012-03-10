class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :voted
      t.integer :war_id

      t.timestamps
    end
  end
end
