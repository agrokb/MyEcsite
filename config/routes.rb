Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resource :products,only: [:index,:show]

  namespace :admin do
    root 'products#index'
    resources :products
  end
end
