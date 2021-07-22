Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    get 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources 'schedules', only: [:index, :show]

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :schedules, only: %i[index show create destroy]
      resources :events, only: %i[index]
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
