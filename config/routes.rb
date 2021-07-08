Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'schedules/index'
    end
  end
  devise_for :users, skip: [:sessions]
  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    get 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources 'schedules', only: [:index, :show, :create, :update, :destroy]

  root to: 'home#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
