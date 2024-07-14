Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :categories
  resources :stores
  resources :repair_requests
  # Defines the root path route ("/")
  # root "posts#index"
end
