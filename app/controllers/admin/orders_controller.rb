class Admin::OrdersController < ApplicationController
  
  def show
  end
  
  def update
    @order_details = Orderdetails.all
  end

end
