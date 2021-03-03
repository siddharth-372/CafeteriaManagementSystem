class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :adder_id
      t.string :who
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
