Rails.application.routes.draw do
  #get 'prototypes/index'
  root to: "prototypes#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # devise 未導入のため、コメントアウトとする
  # devise_for :users
  root to: 'prototypes#index'
  
  # プロトタイプの中身にコメントを表示するため下記のように記載する
  resources :prototypes do
    resources :comments, only: :create
  end

end