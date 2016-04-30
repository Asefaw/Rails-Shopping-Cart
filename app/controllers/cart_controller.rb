class CartController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  def index
  	if session[:cart] then
  		@cart = session[:cart]
  	else
  	 	@cart = {}
  	end
  end

  def addItem
  	item_id = params[:id]
	if session[:cart] then
		cart = session[:cart]
	else
		session[:cart] = {}
		cart = session[:cart]
	end

	#if item was already in the cart raise the qunatity'
	if cart[item_id] then
		cart[item_id] += 1
	else
		cart[item_id] = 1
	end
	redirect_to :action => :index
  end

  def clearCart
  	session[:cart] = nil
  	redirect_to :action => :index
  end

  #placing an order
  
  
end
