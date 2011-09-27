class CreateKlasses < ActiveRecord::Migration
  def self.up
    create_table :klasses do |t|
      t.string :name
      t.string :school
      t.string :teacher
      t.integer :year
      t.string :term
      t.string :period

      t.timestamps
    end
    
    add_index :klasses, :name
    add_index :klasses, :school
    add_index :klasses, :teacher
    add_index :klasses, :year
  end

  def self.down
    drop_table :klasses
  end
end
