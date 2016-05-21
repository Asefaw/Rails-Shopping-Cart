class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


   
 
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  
  def show
   # id = current_user.id
   # @orders = Order.find_by_user_id(id)
  end

  # GET /orders/new
  def new
    @order = Order.new(:item_ordered => params[:itemid],:user_id => params[:user_id])
     #@cart.each do |c|
     #order.item_ordered = params[:itemid]
     #order.user_id = params[:user_id] 
    #end
      
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
     #redirect_to item_update_path
    #@order = current_user.orders.build(order_params)
    #@order.item_id = params[:item_id]
    respond_to do |format|
      if @order.save
         
       # i = Item.new
        #i.updateItem(params[:item_ordered],params[:itemid])
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def updateItem(item_ordered,itemid)
    #qty = params[:item_ordered]
    @item = Item.find_by_id(itemid)
    @item.quantity = @item.quantity - 1
    @item.save
    respond_to do |format|
      if @order.save

        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:orderdate, :user_id,:item_ordered)
    end
end
