class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /carts
  # GET /carts.json
  def checkout
    #@carts.each do |c|
      @order = Order.new
      @order.item_ordered = params[:itemid]
      @order.user_id = params[:user_id] 
      @order.orderdate = Datetime.now
      @order.save
    #end
  end

  
  def index
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
#--------------------------------------------------------------
  def add
      item_id = params[:id]
      if session[:cart] then
        cart = session[:cart]
      else
        session[:cart] = {}
        cart = session[:cart]
      end
 

  # check if item was already in the cart 
  # if it is incerement the qunatity'
  # otherwise quntitity is 1
    if cart[item_id] then
      cart[item_id] += 1
    else
      cart[item_id] = 1
    end
      redirect_to :action => :index   
  end
  #---------------------------------------------------------------------
  #clear a cart
  def emptyCart

    session[:cart] = {}
    redirect_to :action => :index
  end
  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  def remove
    #item_id = params[:item_id]
    #@cart.item = nil
    #redirect_to :action => :index
  end
  # GET /carts/new
  # the user_id associated with cart is the current user_id
  def new
    @cart = Cart.new
    @cart.user_id = current_user.id
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id)
    end
end
