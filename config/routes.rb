Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :groups, only: %i[new create]
  resources :operations, only: %i[new create]
end
