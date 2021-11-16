class Public::OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  
  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm

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

    @customer = Customer.find(current_customer.id)
    @cart_items = @customer.cart_items
    @sum = 0

  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.make_status = 0
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).reverse_order.page(params[:page]).per(10)
    # @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @orders)

  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
  end

end

private

def order_params
    params.require(:order).permit(:customer_id, :payment_method, :mailing_address_postal_code, :mailing_address, :mailing_address_name, :billing, :postage, :status)
end

def order_detail_params
    params.require(:order_detail).permit(:item_id, :price, :amount)
end