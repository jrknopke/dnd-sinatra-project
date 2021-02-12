class ChangeCharactersToSpells < ActiveRecord::Migration
  def change
    rename_table :characters, :spells
  end
end
