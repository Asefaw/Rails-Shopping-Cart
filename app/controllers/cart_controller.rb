class CartController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  def index
  	if session[:cart] then
  		@cart = session[:cart]
  	else
  	 	@cart = {}
  	end
  end

# the addItem method will add a product to the cart session using product id
# if cart there is a cart with products use that cart 
# otherwise the cart is empty

  def addItem
  	product_id = params[:id]
	if session[:cart] then
		cart = session[:cart]
	else
		session[:cart] = {}
		cart = session[:cart]
	end

	# check if item was already in the cart 
  # if it is incerement the qunatity'
  # otherwise quntitity is 1
	if cart[product_id] then
		cart[product_id] += 1
	else
		cart[product_id] = 1
	end
	redirect_to :action => :index
  end

 # empty the current cart with products in it
 # and refresh the page by redirecting
  def clearCart
  	session[:cart] = nil
  	redirect_to :action => :index
  end

  #placing an order
  # i'm tryng to palce the order by calling the placeOrder method in the Order Model
  # but i'm problem getting the the values from the cart view 
  #order = Order.new
  #order.palceOrder(cust_id, product_id, order_date, total)
  
  
end
