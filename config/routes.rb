Rails.application.routes.draw do

  devise_for :users
  resource :home, only: [:index]

  root to: 'home#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
