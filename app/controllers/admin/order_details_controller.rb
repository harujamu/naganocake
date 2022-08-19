class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
  end
  private

def cart_item_params
  params.require(:cart_item).permit(:amount, :item_id)
end

end
