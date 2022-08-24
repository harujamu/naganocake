class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order

    if @order_detail.production_status == "production"
      @order.update(order_status:"production")

    elsif @order.order_details.count == @order.order_details.where(production_status: "production_completed").count
      @order.update(order_status:"shipping_preparation")
    end
    redirect_to admin_show_orders_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :tax_included_price, :production_status)
  end

  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :postage, :billing_amount, :order_status)
  end
end
