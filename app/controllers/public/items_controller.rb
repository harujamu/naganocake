class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.page(params[:page])
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  private

    def item_params
      params.require(:item).permit(:name,:introduction,:price,:is_active, :genre_id, :image)
    end

    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end

end
