class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @genres = Genre.all.page(params[:page]).per(4)
  end

  def show
    @genres = Genre.all.page(params[:page]).per(4)
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
