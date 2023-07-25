Rails.application.routes.draw do
  #get 'prototypes/index'
  root to: "prototypes#index"
  devise_for :users
  resources :users, only: :show
  
  resources :prototypes do
    resources :comments, only: :create
  end

end