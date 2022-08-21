class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @customer = current_customer
    @order_details = OrderDetail.all
    @total = 0
    @total_amount = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_show_orders_path
  end

  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page])
    # @cart_items = @customer.cart_items
    @total_amount = 0
    @order_details = OrderDetail.all
  end

private

  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :postage, :billing_amount, :order_status)
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :tax_included_price, :production_status)
  end

end
