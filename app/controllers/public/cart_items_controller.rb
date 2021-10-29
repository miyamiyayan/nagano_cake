class Public::CartItemsController < ApplicationController

  def index
    @customer = Customer.find(current_customer.id)
    @cart_items = @customer.cart_items
    @sum = 0
  end

  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end

end

private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end