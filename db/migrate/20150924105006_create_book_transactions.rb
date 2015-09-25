class CreateBookTransactions < ActiveRecord::Migration
  def up
    create_table :book_transactions do |t|
    	t.column :isbn, :integer
    	t.column :member_id, :integer
    end
  end
  def down
  	drop_table :book_transactions
  end
end
