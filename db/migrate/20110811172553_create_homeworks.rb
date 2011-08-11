class CreateHomeworks < ActiveRecord::Migration
  def self.up
    create_table :homeworks do |t|
      t.string :name
      t.text :criteria
      t.datetime :deadline
      t.string :state
      t.integer :owner_id

      t.timestamps
    end

    add_index :homeworks, :deadline
    add_index :homeworks, :owner_id, :null => false
  end

  def self.down
    drop_table :homeworks
  end
end
