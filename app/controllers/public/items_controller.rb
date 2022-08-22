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

  def genre
    @genre = Genre.find(params[:id])
    # @item = Item.find(params[:id])
    @items = genre.items.all
  end


  private

    def item_params
      params.require(:item).permit(:name,:introduction,:price,:is_active, :genre_id, :image)
    end

    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end
    
    def genre_params
    params.require(:genre).permit(:name, :id)
    end

end
