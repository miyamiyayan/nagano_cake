class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @customer = Customer.find(current_customer.id)
    @cart_items = @customer.cart_items
    @sum = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @customer = Customer.find(current_customer.id)
    @cart_items = @customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @validate_into_cart = @cart_item.validate_into_cart
      if @validate_into_cart == false
        flash[:into_cart_error] = "個数が選択されていないか、すでにカートに追加されているアイテムです。"
        redirect_to item_path(params[:cart_item][:item_id])
      else
        @cart_item.save
        redirect_to cart_items_path
      end
  end

end

private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end