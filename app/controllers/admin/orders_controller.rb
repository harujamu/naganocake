class Admin::OrdersController < ApplicationController
  
  def show
  end
  
  def update
    @order_details = Orderdetails.page(params[:page])
  end

end
