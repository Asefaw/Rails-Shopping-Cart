class Shopper < ActiveRecord::Base
	has_many :orders
    has_one :cart
end
