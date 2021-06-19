Rails.application.routes.draw do

  devise_for :users
  resource :home, only: [:index]

  root to: 'home#index'
end
