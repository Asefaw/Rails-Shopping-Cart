class Cart < ActiveRecord::Base
  belongs_to :shopper
  has_many :item_carts
  has_many :items, through: :item_carts
end
