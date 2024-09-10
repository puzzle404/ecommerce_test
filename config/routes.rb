Rails.application.routes.draw do
  devise_for :users

  resource :cart, only: [:show, :update, :destroy]
  resources :orders, only: [:new, :create]

  root "products#index"
end
