class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :user
      t.integer :quantity
      t.string :product
      t.decimal :price
      t.decimal :total
      t.datetime :datetime

      t.timestamps
    end
  end
end
