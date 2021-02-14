class ChangeClassColumn < ActiveRecord::Migration
  def change
    rename_column :spells, :class, :character_class
  end
end
