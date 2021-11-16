class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def show
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    customer.update(customer_params)
    redirect_to customers_path
  end

  def confirm
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
    customer = Customer.find(current_customer.id)
    customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

private

 def customer_params
   params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
 end

end