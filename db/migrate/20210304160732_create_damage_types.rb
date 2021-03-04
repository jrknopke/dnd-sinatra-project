class CreateDamageTypes < ActiveRecord::Migration
  def change
    add_column :spells, :damage_dice, :string
    add_column :spells, :damage_type, :string
  end
end
