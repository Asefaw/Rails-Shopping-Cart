class Cart < ActiveRecord::Base
  belongs_to :customer
  has_many :product_cart
  has_many :product, through: :product_cart
  
end
