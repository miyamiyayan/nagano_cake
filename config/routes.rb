Rails.application.routes.draw do

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

  root to: 'public/homes#top'
  get "/about" => 'public/homes#about'
  get "/items" => 'public/items#index'
  get "/items/:id" => 'public/items#show'
  resources :customers, only:[:show, :edit, :update]
  post "/customers/confirm" => 'public/customers#confirm'
  patch "/customers/withdraw" => 'public/customers#withdraw'


  namespace :admin do
    get '/' => 'homes#top'
    resources :items
    
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end