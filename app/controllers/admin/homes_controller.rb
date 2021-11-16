class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @orders = Order.all.reverse_order.page(params[:page]).per(10)
  end

end
