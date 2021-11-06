class ApplicationController < ActionController::Base




  before_action :configure_permitted_parameters, if: :devise_controller?


  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    render "items"
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end



end
