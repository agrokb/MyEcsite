Rails.application.routes.draw do
  devise_for :managers, controllers: {sessions: 'managers/sessions',registrations:'managers/registrations' }
  root 'products#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resource :products,only: [:index,:show]

  namespace :admin do
    root 'products#index'
    resources :products,except: [:show]
    resources :vendors,except: [:show]
  end
end
