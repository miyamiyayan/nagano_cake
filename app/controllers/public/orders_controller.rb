class Public::OrdersController < ApplicationController

  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
    @sum = 0
  end

  def confirm
    @customer = Customer.find(current_customer.id)
    @cart_items = @customer.cart_items

    if params[:order][:address_option] == "0"
        @order = Order.new(order_params)
        @order.mailing_address_postal_code = current_customer.postal_code
        @order.mailing_address = current_customer.address
        @order.mailing_address_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
        @order = Order.new(order_params)
        @address = Address.find(params[:order][:address_id])
        @order.mailing_address_postal_code = @address.postal_code
        @order.mailing_address = @address.address
        @order.mailing_address_name = @address.name
    elsif params[:order][:address_option] == "2"
        @order = Order.new(order_params)
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

private

def order_params
    params.require(:order).permit(:customer_id, :payment_method, :mailing_address_postal_code, :mailing_address, :mailing_address_name)
end