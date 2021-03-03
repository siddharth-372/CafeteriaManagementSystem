class ChangeOrderitemsToBeJsonInOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :orderitems
    add_column :orders, :orderitems, :json
  end
end
