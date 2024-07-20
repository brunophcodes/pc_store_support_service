Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :categories
  resources :stores
  resources :repair_requests
  get 'pages/farewell', to:'pages#farewell'
  get 'pages/sorry', to: 'pages#sorry' 
  get '/404', to: 'errors#not_found'
  get '/406', to: 'errors#unacceptable'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
  # Defines the root path route ("/")
  # root "posts#index"
end
