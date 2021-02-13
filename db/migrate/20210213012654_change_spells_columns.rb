class ChangeSpellsColumns < ActiveRecord::Migration
  def change
    remove_column :spells, :concentration
    remove_column :spells, :ritual
  end
end
