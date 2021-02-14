class ChangeNameColumn < ActiveRecord::Migration
  def change
    rename_column :spells, :name, :spell_name
  end
end
