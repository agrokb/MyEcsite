Rails.application.routes.draw do
  root 'products#index'

  resource :products,only: [:index,:show]
end
