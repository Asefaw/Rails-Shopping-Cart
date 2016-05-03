class Customer < ActiveRecord::Base
	has_many :order
	has_one :cart
end
