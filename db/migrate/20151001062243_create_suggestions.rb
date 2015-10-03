class CreateSuggestions < ActiveRecord::Migration
  def up
    create_table :suggestions do |t|
      t.integer :isbn
      t.string :book_name
      t.string :author          
      t.text :description
      t.timestamps null: false
    end
  end
end
