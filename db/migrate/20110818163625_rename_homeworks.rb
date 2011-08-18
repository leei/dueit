class RenameHomeworks < ActiveRecord::Migration
  def self.up
    rename_table :homeworks, :homework
  end

  def self.down
    rename_table :homework, :homeworks
  end
end
