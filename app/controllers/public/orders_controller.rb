class Public::OrdersController < ApplicationController

  def new
    @customer = Customer.find(current_customer.id)
  end

  def comfirm
    if params[:order][:address_option] == "0"
    elsif params[:order][:address_option] == "1"
    elsif params[:order][:address_option] == "2"
    end


  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

end
