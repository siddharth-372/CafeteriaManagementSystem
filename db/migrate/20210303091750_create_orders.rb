class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.string :who
      t.date :data_ordered
      t.boolean :status
      t.integer :total_price
      t.json :orderitems

      t.timestamps
    end
  end
end
