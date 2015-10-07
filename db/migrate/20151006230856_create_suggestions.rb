class CreateSuggestions < ActiveRecord::Migration
  def up
    create_table :suggestions do |t|
      t.integer :isbn
      t.string :name
      t.string :authors
      t.text :description

      t.timestamps null: false
    end
  end
  def down
  	drop_table :suggestions
  end
end
