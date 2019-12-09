Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'

  resources :tweets, only: %i(new create edit update destroy)
end

