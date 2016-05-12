class Order < ActiveRecord::Base
  belongs_to :shopper
  has_many :item_orders
  has_many :items, through: :item_orders
end
