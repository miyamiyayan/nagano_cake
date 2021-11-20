class Public::HomesController < ApplicationController

  def top
    @items = Item.where(is_active: true).page(params[:page]).per(4)
    @genres = Genre.all.page(params[:page]).per(4)

  end

  def about
  end

end
