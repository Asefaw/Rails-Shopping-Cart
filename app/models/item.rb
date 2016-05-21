class Item < ActiveRecord::Base
	has_many :item_orders
    has_many :orders, through: :item_orders
    has_many :item_carts
    has_many :carts, through: :item_carts
    
    def updateitem(item_ordered,itemid)
        #qty = params[:item_ordered]
        self.find_by_id(1)
        self.quantity = self.quantity - item_ordered
        self.save 
    end
end
