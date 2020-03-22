Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: "customers/sessions",
  }
  root to: 'homes#index'

  resources :customers, only: [:edit, :update]

  resources :homes, only: [:index]

  resources :products, only: [:index, :show]

  resources :carts, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  resources :purchases, only: [:index, :pay]

  post 'purchases/pay' => 'purchases#pay'


end
