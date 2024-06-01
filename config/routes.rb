Rails.application.routes.draw do
 

  namespace :admin do
    get 'users/index'
    get 'users/show'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'pages/home'
    resources :orders, only: %i[show update]
    resources :users, only: %i[index show update]
  end
  
  namespace :users do
    get 'orders/index'
    get 'orders/show'
    get 'orders/success'
  end
  namespace :user do
    get 'cart_items/index'
  end
  namespace :users do
    get 'products/index'
    get 'products/show'
  end
  devise_for :admins
   
  devise_for :users
  
  namespace :admin do
    resources :products, only: %i[index show new create edit update]
  end

  scope module: :users do
    resources :products, only: %i[index show]
    resources :cart_items, only: %i[index create destroy] do
      resources :orders, only: %i[index show] do
        collection do
          get 'success'
        end
      end
      member do
        patch 'increase'
        patch 'decrease'
      end
    end
    resources :checkouts, only: [:create]
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'flowers/top' => 'flowers#top'
  get "shops/home" => "shops#home"
  resources :flowers 
  resources :perfumes
  root 'flowers#top'

 
   end


 
 

