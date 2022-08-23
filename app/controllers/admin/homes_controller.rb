class Admin::HomesController < ApplicationController

  def top
    # @orders = Order.page(params[:page])
    # @order_details = OrderDetail.all
    # @cart_items = CartItem.all
    if params[:by_customer_orders]
      @orders = Order.where(name: params[:by_customer_orders])
    else
      @orders = Order.all
    end
    @total_amount = 0
    
  end

private

  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :postage, :billing_amount, :order_status)
  end

end
