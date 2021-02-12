class AddColumnsToSpells < ActiveRecord::Migration
  def change
    add_column :spells, :desc, :string
    add_column :spells, :damage, :string
    add_column :spells, :range, :string
    add_column :spells, :duration, :string
    add_column :spells, :casting_time, :string
    add_column :spells, :ritual, :boolean
    add_column :spells, :concentration, :boolean
    add_column :spells, :material, :string
    add_column :spells, :school, :string
  end
end
