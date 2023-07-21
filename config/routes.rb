Rails.application.routes.draw do
  #get 'prototypes/index'
  root to: "prototypes#index"
  devise_for :users
  
  # プロトタイプの中身にコメントを表示するため下記のように記載する
  resources :prototypes do
    resources :comments, only: :create
  end

end