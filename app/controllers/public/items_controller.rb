class Public::ItemsController < ApplicationController

  def index

    if params[:genre_search]
      @genres = Genre.all
      items = Item.where(genre_id: params[:genre_search])
      @items = items.page(params[:page])
    else
      @genres = Genre.all
      @items = Item.page(params[:page])
    end

  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new

  end

  def genre
    @item = Item.find(params[:id])
    @items = genre.items
    @genre = Genre.find(params[:id])
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
