class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_show_orders_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :tax_included_price, :production_status)
  end
end
