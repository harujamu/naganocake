class Public::CartItemsController < ApplicationController
  
  def index
    @customer = Customer.find(params[:customer_id])
    @cart_item = Cart_item.find(params[:id])
    items = @cart_item.items
    @ones_cart_items = @customer.items
  end

  def update
  end
  
  def destroy
  end

  def destroy_all
  end
  
  def create
  end

end
