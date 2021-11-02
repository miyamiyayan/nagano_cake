Rails.application.routes.draw do

# 以下顧客側
# トップとアバウト
  root to: 'public/homes#top'
  get "/about" => 'public/homes#about'
# マイページと編集
  get "/customers/" => 'public/customers#show'
  get "/customers/edit" => 'public/customers#edit'
  patch "/customers/" => 'public/customers#update'
  get "/customers/confirm" => 'public/customers#confirm'
  patch "/customers/withdraw" => 'public/customers#withdraw'
# カスタマーの商品
  scope module: :public do
    resources :items, only:[:index, :show]
    resources :addresses, except: [:new, :edit]
    delete "/cart_items/destroy_all" => 'cart_items#destroy_all'
    resources :cart_items, except: [:show, :edit, :new]
    post "/orders/confirm" => 'orders#confirm'
    get "/orders/complete" => 'orders#complete'
    resources :orders, only:[:new, :create, :index, :show]


    end


  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :customers, except: [:create, :destroy, :new]
    resources :orders, only:[:show, :update]

  end

  devise_for :admin, controllers: {
   sessions:      'admin/sessions',
   passwords:     'admin/passwords',
   registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
   sessions:      'public/sessions',
   passwords:     'public/passwords',
   registrations: 'public/registrations'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end