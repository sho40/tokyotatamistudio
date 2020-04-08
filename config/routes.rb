Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # オーナー（管理者）
  devise_for :users
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: "customers/sessions",
  }

  root to: 'homes#index'

  #顧客
  resources :customers, only: [:edit, :update]

  # Top画面
  resources :homes, only: [:index]

  #商品
  resources :products, only: [:index, :show]

  # カート周り
  resources :carts, only: [:show]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  # 購入確認、決済機能
  resources :purchases, only: [:index, :pay]
  post 'purchases/pay' => 'purchases#pay'

  #お問い合わせ
  resources :contacts, only: [:new, :create]


end
