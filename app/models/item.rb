class Item < ActiveRecord::Base
	has_many :item_orders
    has_many :orders, through: :item_orders
    has_many :item_carts
    has_many :carts, through: :item_carts
end
