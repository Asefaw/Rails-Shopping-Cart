class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :customer
  has_many :product_order
  has_many :products, through: :product_order
end
