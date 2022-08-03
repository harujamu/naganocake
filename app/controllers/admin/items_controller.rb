class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_show_items_path(@item.id)
  end
  
  def show
    @item = Item.find(params[:id])
    @add_tax_price = (@item.price * 1.1).round
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
    
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end
    
    private
    def item_params
      params.require(:item).permit(:name,:introduction,:price,:is_active, :genre_id, :image)
    end
    
end
