class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    # @total = 0
    @order.postage = 800
    @order.billing_amount = @total.to_i + @order.postage
    @address = Address.find(params[:order][:address_id])

    if params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name

    elsif params[:order][:select_address] == "2"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    end


  end

  def complete
  end

  def create
    # @order = current_customer.orders.build(order_params)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    # each文の始まり
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      # @order_detail.production_status = OrderDetail.production_statuses.key(0)
      @order_detail.amount = cart_item.amount
      @order_detail.tax_included_price = cart_item.item.price * 1.1
      @order_detail.item_id = cart_item.item_id

      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders
    # @cart_items = CartItem.all

  end

  def show
    @order = Order.find(params[:id])
    # @order.billing_amount = @order.postage + @total
    # @cart_items = CartItem.all
    # @order_details = OrderDetail.all
  end

  private

  def cart_item_params
  params.require(:cart_item).permit(:amount, :item_id)
  end

  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :postage, :billing_amount, :order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :tax_included_price, :production_status)
  end
end