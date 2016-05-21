class AddItemsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :item_ordered, :integer
  end
end
