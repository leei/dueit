class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.integer :klass_id
      t.integer :user_id

      t.timestamps
    end
    add_index :members, :klass_id
    add_index :members, :user_id
  end

  def self.down
    drop_table :members
  end
end
