class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :class
      t.integer :level
      t.integer :user_id
    end
  end
end
