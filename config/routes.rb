Rails.application.routes.draw do

# 以下顧客側
# トップとアバウト
  root to: 'public/homes#top'
  get "/about" => 'public/homes#about'
# 商品一覧と詳細
  get "/items" => 'public/items#index'
  get "/items/:id" => 'public/items#show'
# マイページと編集
  get "/customers/" => 'public/customers#show'
  get "/customers/edit" => 'public/customers#edit'
  patch "/customers/" => 'public/customers#update'
  get "/customers/confirm" => 'public/customers#confirm'
  patch "/customers/withdraw" => 'public/customers#withdraw'


  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :customers, except: [:create, :destroy, :new]

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