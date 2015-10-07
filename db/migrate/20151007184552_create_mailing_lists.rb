class CreateMailingLists < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
      t.integer :book_id
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
