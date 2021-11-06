class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all.reverse_order.page(params[:page]).per(10)
  end

end
