class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :customer
  has_many :product_order
  has_many :products, through: :product_order
  after_initialize :set_defualt_values

  def set_defualt_values
    #if current_user
      self.customer_id ||= 1
      self.product_id ||= 1
      self.orderDate ||= '2016-05-09'
      self.totalCharge||= 500 
     #end
  end

#method below palces order by getting values from shopping cart through cart controller
  def placeOrder(cust_id, pr_id, o_date, total)
  	self.customer_id = cust_id
  	self.product_id = pr_id
  	self.orderDate = o_date
  	self.totalCharge = total
  	self.save
  end
end
