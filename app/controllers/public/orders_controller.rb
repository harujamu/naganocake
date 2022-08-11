class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @total = 0
    @postage = 800
    @billing_amount = @total + @postage
    
  end
  
  def complete
  end

  def create
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def cart_item_params
  params.require(:cart_item).permit(:amount, :item_id)
  end
  
  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :postage, :billing_amount, :order_status)
  end
  
end
