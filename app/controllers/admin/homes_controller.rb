class Admin::HomesController < ApplicationController

  def top
    # @orders = Order.page(params[:page])
    @orders = Order.all
    @cart_items = CartItem.all
    @total_amount = 0
    # @order_details = OrderDetail.all
  end

private

  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :postage, :billing_amount, :order_status)
  end

end
